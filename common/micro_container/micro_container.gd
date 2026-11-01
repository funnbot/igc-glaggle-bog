class_name MicroContainer
extends Node2D

@export var initial_time_sec := 1.0

var active_micro: MicroGame = null
# current timers starting value
var _initial_timer := initial_time_sec
var _timer := 0.0

signal reset_timer()
signal update_timer(value: float)


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# TEMP
	await get_tree().create_timer(2.0).timeout
	_start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if _timer <= 0:
		return
	# 0 - 1
	var scaled_timer := _timer / _initial_timer
	update_timer.emit(scaled_timer)
	_timer -= delta


# removes an existing loaded microgame scene
# instantiate the scene at path, add as child
func load_micro_by_path(level_path: StringName) -> Error:
	_unload_micro()
	var micro_scene: PackedScene = load(level_path)
	if micro_scene is not PackedScene:
		push_error("Expected PackedScene, got: ", micro_scene)
		return ERR_INVALID_PARAMETER
	var micro := micro_scene.instantiate()
	if micro is not MicroGame:
		push_error("Expected MicroGame, got: ", micro)
		return ERR_INVALID_PARAMETER
	add_child(micro)
	active_micro = micro
	active_micro.complete.connect(_on_complete)
	return OK


func _unload_micro() -> void:
	if active_micro == null:
		return
	active_micro.complete.disconnect(_on_complete)
	remove_child(active_micro)
	active_micro.queue_free()


# timer ran out before any signal from game
func _timeout() -> void:
	pass


func _on_complete(success: bool) -> void:
	# load next microgame, check if out of lives, change timer.
	
	pass


func _start() -> void:
	if active_micro != null:
		_initial_timer = initial_time_sec
		_timer = _initial_timer
		reset_timer.emit()

		active_micro.start()

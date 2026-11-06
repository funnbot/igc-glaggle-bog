class_name MicroContainer
extends Node2D

@export var micro_time_sec := 3.0
@onready var _timer: TickingTimer = $"Timer"
var _active_micro: MicroGame = null
var _is_micro_running: bool = false
var _micro_result: MicroGame.Result = MicroGame.Result.SUCCESS
# signal _micro_complete()


func _ready() -> void:
	_timer.timeout.connect(_on_complete.bind(MicroGame.Result.TIMEOUT))


## removes an existing loaded microgame scene
## instantiate the scene at path, add as child
## the microgame has process mode disabled, until it is started.
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
	micro.process_mode = Node.PROCESS_MODE_DISABLED
	print_debug("add child ", micro)
	add_child(micro)
	_active_micro = micro
	return OK


func run_micro() -> void:
	if _active_micro == null:
		return
	_timer.start_with_signal(micro_time_sec)
	# TODO: show text overlay like "Catch!"
	_active_micro.process_mode = Node.PROCESS_MODE_PAUSABLE
	_active_micro.complete.connect(_on_complete, CONNECT_ONE_SHOT)
	_is_micro_running = true
	print_debug("start micro ", _active_micro)
	_active_micro.start()


func wait_complete() -> void:
	# if we want to always wait for the timer to run out fully...
	await _timer.timeout
	_unload_micro()


func _unload_micro() -> void:
	if _active_micro == null:
		return
	print_debug("unloading ", _active_micro)
	remove_child(_active_micro)
	_active_micro.queue_free()


## called either by the microgame with success or failure,
## or additionally bound to the timer, and will be called with timeout
## could be called twice at end of microgame
func _on_complete(result: MicroGame.Result) -> void:
	print_debug("complete ", result, " ", self)
	if _is_micro_running:
		if result == MicroGame.Result.TIMEOUT:
			result = MicroGame.Result.SUCCESS if _active_micro.SURVIVE else MicroGame.Result.FAILURE
		# timeout after a result from the microgame, just used to wait for
		_is_micro_running = false
		_micro_result = result
	#_micro_complete.emit()

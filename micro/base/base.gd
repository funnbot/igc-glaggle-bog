extends Node2D

@onready var thing: Node2D = $"Thing"

var active: bool = true;
var timer: float = 0.0;

signal update_timer(value: float);
signal complete(win: bool);
signal lose();

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer = 1.0;


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if not active:
		return;
	timer -= 0.01;
	update_timer.emit(timer);
	if timer <= 0.0:
		complete.emit(false);
		lose.emit();
	if (Input.is_action_just_pressed(&"ui_up")):
		complete.emit(true);
		timer = -1;
		active = false;

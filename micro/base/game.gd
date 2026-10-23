extends Node2D

@onready var thing: Node2D = $"Thing"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (Input.is_action_just_pressed(&"ui_up")):
		thing.move_local_x(10.0);

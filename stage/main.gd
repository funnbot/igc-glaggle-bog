extends Node2D

@onready var micro_container := $"MicroContainer";

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	micro_container.load_micro_by_path(&"res://micro/press_a_game/press_a_game.tscn");
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

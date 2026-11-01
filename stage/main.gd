extends Node2D

@onready var micro_container: MicroContainer = $"MicroContainer"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	micro_container.load_micro_by_path(&"res://micro/press_a_game/press_a_game.tscn")

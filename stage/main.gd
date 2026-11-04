extends Node2D

@onready var micro_container: MicroContainer = $"MicroContainer"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	while true:
		micro_container.load_micro_by_path(&"res://micro/press_a_game/press_a_game.tscn")
		micro_container.run_micro()
		await micro_container.wait_complete()
		await get_tree().create_timer(3).timeout;

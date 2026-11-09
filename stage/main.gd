extends Node2D

@onready var micro_container: MicroContainer = $"MicroContainer"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	while true:
		micro_container.load_micro_by_path(&"res://micro/balance_ball/balance_ball.tscn")
		await micro_container.run_micro()
		await get_tree().create_timer(1).timeout
		get_tree().quit()

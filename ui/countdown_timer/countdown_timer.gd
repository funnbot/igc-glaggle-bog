extends PanelContainer

@onready var _progress_bar: TextureProgressBar = $"TextureProgressBar"


func _ready() -> void:
	_progress_bar.set_value_no_signal(100.0)


func _on_reset_timer() -> void:
	_progress_bar.value = 100.0


# value is between 0 and 1
func _on_update_timer(value: float) -> void:
	value = clampf(value, 0, 1)
	_progress_bar.value = value * 100.0

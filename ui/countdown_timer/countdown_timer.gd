extends PanelContainer

@onready var _progress_bar: TextureProgressBar = $"TextureProgressBar"

var _percent_left: float = 1.0


func _ready() -> void:
	_percent_left = 1.0
	_progress_bar.set_value_no_signal(100.0)


func _process(delta: float) -> void:
	_progress_bar.set_value_no_signal(_percent_left * 100.0)


func _on_timer_tick(time_left: float, time_initial: float) -> void:
	var percent := clampf(time_left / time_initial, 0, 1)
	_percent_left = percent
	# _progress_bar.set_value_no_signal(percent * 100.0)


func _on_timer_start(sec: float) -> void:
	_percent_left = 1.0
	_progress_bar.set_value_no_signal(100.0)

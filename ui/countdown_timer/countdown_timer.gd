extends PanelContainer

@onready var _progress_bar: TextureProgressBar = $"TextureProgressBar"

var _time_initial: float = 0
var _time_left: float = 0


func _ready() -> void:
	_progress_bar.set_value_no_signal(100.0)


func _process(delta: float) -> void:
	_time_left -= delta
	_progress_bar.value = clampf(_time_left / _time_initial, 0, 1) * 100

func _on_timer_tick(time_left: float, time_initial: float) -> void:
	var percent := clampf(time_left / time_initial, 0, 1);
	_progress_bar.value = percent;

func _on_timer_start(sec: float) -> void:
	_progress_bar.value = 100
	_time_initial = sec
	_time_left = sec

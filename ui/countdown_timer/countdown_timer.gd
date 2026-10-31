extends PanelContainer

@onready var _progress_bar: TextureProgressBar = $"TextureProgressBar";

func _ready() -> void:
	_progress_bar.set_value_no_signal(100.0);
	pass # Replace with function body.

func _process(delta: float) -> void:
	pass

func reset_timer() -> void:
	_progress_bar.value = 100.0;

# value is between 0 and 1
func update_timer(value: float) -> void:
	_progress_bar.value = value * 100.0;

extends PanelContainer

@onready var progress_bar: TextureProgressBar = $"TextureProgressBar";

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	progress_bar.set_value_no_signal(100.0);
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func update_timer(value: float) -> void:
	progress_bar.set_value_no_signal(value * 100.0);

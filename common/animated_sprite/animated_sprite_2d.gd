@tool
extends Sprite2D

@export var animation_length: float = 1.0;
@export_tool_button("Trigger") var trigger := _on_trigger;
var timer: float = 0.0;

var _total_frames: int = 0;

var _frame_length: float = 0;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.frame = 0;
	self.visible = false;

func _on_trigger() -> void:
	_trigger();

func _trigger() -> void:
	_total_frames = self.hframes * self.vframes;
	_frame_length = animation_length / float(_total_frames);
	timer = _frame_length;
	self.frame = 0;
	self.visible = true;
	for i in range(_total_frames):
		self.frame += 1;
		await get_tree().create_timer(_frame_length).timeout;
	self.visible = false;

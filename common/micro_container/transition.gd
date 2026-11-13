extends Panel

@export var time_sec: float = 1.0


func _on_transition_begin() -> void:
	self.visible = true
	self.material.set_shader_parameter("progress", 0.0)
	var t := create_tween()
	t.tween_property(self.material, "shader_parameter/progress", 1.0, time_sec)
	t.tween_callback(
		func() -> void:
			self.visible = false,
	)

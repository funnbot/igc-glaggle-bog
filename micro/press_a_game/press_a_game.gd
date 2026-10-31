extends MicroGame


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_key_pressed(KEY_A):
		complete.emit(true);


func start() -> void:
	pass


func timeout() -> void:
	complete.emit(false);

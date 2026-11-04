extends MicroGame


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_key_pressed(KEY_A):
		complete.emit(Result.SUCCESS)


func start() -> void:
	pass

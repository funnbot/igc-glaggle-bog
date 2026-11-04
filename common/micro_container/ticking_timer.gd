class_name TickingTimer
extends Timer

signal tick(time_left: float, time_initial: float)
signal started(time_left: float)


func start_with_signal(time_sec: float = -1) -> void:
	self.start(time_sec)
	started.emit(time_sec)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if not self.is_stopped():
		tick.emit(self.time_left, self.wait_time)

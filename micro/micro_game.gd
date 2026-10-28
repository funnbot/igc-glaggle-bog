# The root of each microgame
# Used by microgame_container to get input and output on state of microgame

class_name MicroGame extends Node

# Signal must be emitted to continue at all.
# Is the result of a microgame always a boolean?
signal complete(success: bool);

# Called after _ready when the microgame starts, the timer starts counting down
func on_start() -> void:
	pass

# Called when the timer runs out for this game, usually indicating they failed.	
func on_timeout() -> void:
	pass

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

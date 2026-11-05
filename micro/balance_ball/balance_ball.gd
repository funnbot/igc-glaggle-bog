extends MicroGame

@export var starting_rot_bias: float = 0.1
@export var ball_radius: float = Unit.ONE;
@onready var _ball: Node2D = $"Ball"
@onready var _character: Node2D = $"Character"

@onready var _character_origin: Vector2 = _character.position


func start() -> void:
	pass


func _process(_delta: float) -> void:
	_set_roll(sin(Time.get_ticks_usec() / 1000000.0) / 2.0)
	_set_lean(sin(Time.get_ticks_usec() / 1000000.0) / 2.0)


## rot in radians
func _set_roll(rot: float) -> void:
	_ball.rotation = rot
	_ball.position.x = rot * ball_radius
	_character.position.x = _ball.position.x


## rot in radians
func _set_lean(rot: float) -> void:
	#_character.position.x = _character_origin.x + _ball.position.x + ball_radius * sin(rot)
	#_character.position.y = ball_radius * -cos(rot)
	_character.rotation = rot

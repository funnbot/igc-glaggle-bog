extends MicroGame

@export var starting_rot_bias: float = 0.1
@export var ball_radius: float = Unit.ONE
@export var character_height: float = Unit.ONE * 4
@export var character_mass: float = 50
@export var move_speed: float = 500.0

@onready var _ball: RigidBody2D = $"Ball"
@onready var _character: RigidBody2D = $"Character"
@onready var _ball_pivot: StaticBody2D = $"BallPivot"

## radians
var _roll: float = 0
var _roll_vel: float = 0
var _roll_accel: float = 0
## radians
var _lean: float = 0
var _lean_vel: float = 0

var _inertia: float = (1.0 / 3.0) * character_mass * character_height * character_height


func start() -> void:
	_lean = deg_to_rad(10)


func _process(delta: float) -> void:
	_ball_pivot.position.x = _ball.position.x


func _physics_process(delta: float) -> void:
	var input := Input.get_axis(&"move_left", &"move_right") * move_speed
	_ball.apply_force(Vector2(input, 0))
	_ball_pivot.position.x = _ball.position.x


func _process_old(_delta: float) -> void:
	var target_vel := Input.get_axis(&"move_left", &"move_right") * move_speed
	var new_vel := move_toward(_roll_vel, target_vel, 10.0 * _delta)

	#+ sin(Time.get_ticks_usec() / 1000000.0) / 10.0
	_roll_accel = ((new_vel - _roll_vel) / _delta)
	_roll_vel = new_vel

	_roll += _roll_vel * _delta
	#_lean -= Input.get_axis(&"move_left", &"move_right") * move_speed * 0.5
	_set_roll(_roll)
	_calculate_lean_physics(_delta)
	_set_lean(_lean)


func _calculate_lean_physics(_delta: float) -> void:
	#if _lean == 0:
	#	_lean = (randf() * 2 - 1) * PI / 180
	var grav_torque := (1.5 * (9.8 * Unit.ONE) / character_height) * sin(_lean)
	var ball_torque := (-1.5 * _roll_accel / character_height) * cos(_lean) * Unit.ONE
	var ang_accel := grav_torque + ball_torque
	_lean_vel += (ang_accel) * _delta
	var drag := -(0.1 / _inertia) * _lean_vel * _lean_vel

	_lean_vel += drag * _delta
	#_lean_vel *= clampf(1.0 - 0.5 * _delta, 0, 1)
	_lean += _lean_vel * _delta


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

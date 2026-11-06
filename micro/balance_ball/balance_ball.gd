extends MicroGame

@export var rotation_limit_deg: float = 90
@export var move_speed: float = 500.0

@onready var _ball: RigidBody2D = $"Ball"
@onready var _character: RigidBody2D = $"Character"
@onready var _ball_pivot: StaticBody2D = $"BallPivot"


func start() -> void:
	self.SURVIVE = true


func _physics_process(_delta: float) -> void:
	var input := Input.get_axis(&"move_left", &"move_right") * move_speed
	_ball.apply_force(Vector2(input, 0))
	if _ball_pivot != null:
		_ball_pivot.position.x = _ball.position.x
	if abs(_character.rotation) > deg_to_rad(rotation_limit_deg):
		complete.emit(Result.FAILURE)
		if _ball_pivot != null:
			_ball_pivot.queue_free()

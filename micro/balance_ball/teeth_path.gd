extends Path2D

const TEETH: PackedScene = preload("uid://dfglylpq454td")

const TEETH_VARIANT_1: Texture2D = preload("uid://ccg4ht5vr82ny")
const TEETH_VARIANT_2: Texture2D = preload("uid://b36pb6jhqau76")
const TEETH_VARIANT_3: Texture2D = preload("uid://bwkb1ei5md85x")

@export var teeth_count: int = 5
@export var juggle_speed: float = 0.4

var _children: Array[PathFollow2D] = []


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var ratio: float = 1.0 / teeth_count
	for i in range(teeth_count):
		var child: PathFollow2D = TEETH.instantiate()
		child.get_child(0).texture = _rand_teeth()
		add_child(child)
		_children.push_back(child)
		child.progress_ratio = i * ratio


func _rand_teeth() -> Texture2D:
	return [TEETH_VARIANT_1, TEETH_VARIANT_2, TEETH_VARIANT_3][randi() % 3]


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	for i in range(len(_children)):
		_children[i].progress_ratio += juggle_speed * delta

extends Node


func _ready() -> void:
	if not OS.has_feature("editor"):
		return
	var current := get_tree().current_scene.scene_file_path
	if current.is_empty():
		return
	if current.get_base_dir().get_base_dir() != "res://micro":
		return
	print("OVERTAKE")
	await get_tree().process_frame
	var ok := get_tree().change_scene_to_file("res://common/micro_container/micro_container.tscn")
	if ok != OK:
		return
	await get_tree().process_frame
	var container := get_tree().current_scene as MicroContainer
	container.load_micro_by_path(current)
	await container.run_micro()

extends Button
class_name SceneChangeButton

@export var next_scene_path: String;

func _pressed() -> void:
	get_tree().change_scene_to_file(next_scene_path)

extends Node2D
class_name PickCoca

@export var next_scene: PackedScene = null

func _on_coca_plant_coca_plant_farmed() -> void:
	get_tree().change_scene_to_packed(next_scene)

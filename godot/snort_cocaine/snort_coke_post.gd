extends Node3D

@export var next_scene: PackedScene

func _on_animation_player_animation_finished(_anim_name: StringName) -> void:
	get_tree().change_scene_to_packed(next_scene)

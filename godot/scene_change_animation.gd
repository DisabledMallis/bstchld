extends AnimationPlayer

@export var next_scene: String

func change_scene() -> void:
	get_tree().change_scene_to_file(next_scene)

func _on_animation_finished(_anim_name: StringName) -> void:
	call_deferred("change_scene")

func _ready() -> void:
	animation_finished.connect(_on_animation_finished)

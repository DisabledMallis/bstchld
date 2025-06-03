extends Sprite2D

@export var next_scene: String;
@export var hitbox: Area2D = null

func _input_hitbox(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event.is_action_released("interact"):
		get_tree().change_scene_to_file(next_scene)

func _ready() -> void:
	hitbox.input_event.connect(_input_hitbox)

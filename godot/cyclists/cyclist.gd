extends Node2D
class_name Cyclist

@export var speed: float = 100.0
@export var left: bool = false
@export var sprite: Sprite2D;

signal cyclist_shot(cyclist: Cyclist)

func _ready() -> void:
	sprite.flip_h = not left

func _process(delta: float) -> void:
	position.x += delta * speed * (-1 if left else 1)

func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event.is_action_pressed("interact"):
		cyclist_shot.emit(self)
		queue_free()

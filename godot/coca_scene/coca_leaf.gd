extends Sprite2D
class_name CocaLeaf

@export var hitbox: Area2D = null
@export var freeWhenPicked: bool = true

signal coca_picked(leaf: CocaLeaf)

var picked: bool = false

func _on_hitbox_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event.is_action_released("interact"):
		coca_picked.emit(self)
		picked = true
		if freeWhenPicked:
			queue_free()

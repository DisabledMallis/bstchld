extends CanvasLayer

@export var money_get_scene: PackedScene
@export var spawn_rate: float = 0.0

var timer: float = 0.0

func _process(delta: float) -> void:
	timer += delta
	if timer >= spawn_rate:
		timer -= spawn_rate
		
		add_child(money_get_scene.instantiate())

extends Node2D

@export var spawners: Array[Node2D];
@export var spawner_directions: Array[bool];
@export var spawn_rate: float = 0.5;
@export var cyclist: PackedScene;

var timer: float = 0.0

func _on_cyclist_killed(cyclist: Cyclist) -> void:
	pass

func _process(delta: float) -> void:
	if timer >= spawn_rate:
		timer -= spawn_rate
		
		var i = 0
		for spawner in spawners:
			var cyclist_obj = cyclist.instantiate() as Cyclist
			cyclist_obj.left = spawner_directions[i]
			add_child(cyclist_obj)
			cyclist_obj.cyclist_shot.connect(_on_cyclist_killed)
			cyclist_obj.position = spawner.position
			i += 1
	
	timer += delta

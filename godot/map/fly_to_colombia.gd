extends Node2D

@export var flight_duration: float = 2.0
@export var plane_radius: float = 100.0
@export var next_scene: PackedScene = null
@export var plane_sprite: Sprite2D = null
@export var plane_path: PathFollow2D = null

func _process(delta: float) -> void:
	var progress: float = delta * (1.0 / flight_duration)
	var mouse_pos = get_global_mouse_position()
	var plane_pos = plane_path.global_position
	
	var plane_clicked = mouse_pos.distance_to(plane_pos) < plane_radius
	
	var plane_height = (lerp(1.0, 0.0, abs(0.5 - plane_path.progress_ratio)) - 0.5) * 2
	print(plane_height)
	plane_sprite.scale = Vector2.ONE * (0.1 + (plane_height * 0.2))
	
	if Input.is_action_pressed("interact") and plane_clicked:
		plane_path.progress_ratio += progress
	else:
		plane_path.progress_ratio -= progress
		
	if plane_path.progress_ratio >= 1.0:
		get_tree().change_scene_to_packed(next_scene)

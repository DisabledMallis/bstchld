extends Sprite2D

var real_pos: Vector2 = Vector2.ZERO
@export var move_range: Vector2 = Vector2.ZERO

@export var shoot_prog: float = 0.0

func _process(delta: float) -> void:
	var mouse_pos = get_global_mouse_position()
	var resolution = get_window().size
	
	var ratio = Vector2(mouse_pos.x / resolution.x, mouse_pos.y / resolution.y)
	
	position = real_pos + ratio*move_range
	rotation = clamp(PI*.15*shoot_prog, 0.0, PI * 0.25)
	shoot_prog -= delta
	shoot_prog = clampf(shoot_prog, 0.0, 2.0)
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("interact"):
		shoot_prog += 1.0

func _ready() -> void:
	real_pos = position 

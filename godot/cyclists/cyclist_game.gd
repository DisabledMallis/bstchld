extends Node2D

@export var spawners: Array[Node2D];
@export var spawner_directions: Array[bool];
@export var spawn_rate: float = 0.5;
@export var cyclist: PackedScene;
@export var score_label: RichTextLabel;
@export var victory_score: int = 10
@export var next_scene: PackedScene;

var score_format: String;
var timer: float = 0.0
var score: int = 0

func update_score():
	score_label.text = score_format % [score, victory_score]

func _on_cyclist_killed(cyclist: Cyclist) -> void:
	score += 1
	update_score()

func _process(delta: float) -> void:
	if score >= victory_score:
		get_tree().change_scene_to_packed(next_scene)
		
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

func _ready() -> void:
	score_format = score_label.text
	update_score()

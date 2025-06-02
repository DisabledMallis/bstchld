extends Node2D

@export var trough: Sprite2D = null
@export var leaves: Array[CocaLeaf];
@export var next_scene: PackedScene = null

var picked_count: int = 0

func _on_leaf_clicked(leaf: CocaLeaf) -> void:
	if not leaf.picked:
		picked_count += 1
	
	if trough != null:
		leaf.global_position = trough.global_position
		leaf.rotation = randf() * TAU
	
	if picked_count >= leaves.size():
		get_tree().change_scene_to_packed(next_scene)

func _ready() -> void:
	for leaf in leaves:
		leaf.coca_picked.connect(_on_leaf_clicked)

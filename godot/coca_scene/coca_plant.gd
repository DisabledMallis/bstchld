extends Node2D
class_name CocaPlant

@export var coca_leaves: Array[CocaLeaf];

var picked: int = 0

signal coca_plant_farmed

func _on_leaf_picked(leaf: CocaLeaf) -> void:
	picked += 1
	if picked >= coca_leaves.size():
		coca_plant_farmed.emit()

func _ready() -> void:
	for leaf in coca_leaves:
		leaf.coca_picked.connect(_on_leaf_picked)

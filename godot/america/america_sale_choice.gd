extends Node2D
class_name AmericaSaleChoice

@export var doomer: Sprite2D = null
@export var baller: Sprite2D = null
@export var whore: Sprite2D = null

@export var scene_after_sold: String

func check_all_sold() -> void:
	var all_sold = SalesGlobals.sold_to_baller and SalesGlobals.sold_to_doomer and SalesGlobals.sold_to_whore
	if all_sold:
		get_tree().change_scene_to_file(scene_after_sold)

func _ready() -> void:
	if SalesGlobals.sold_to_doomer:
		doomer.queue_free()
	if SalesGlobals.sold_to_baller:
		baller.queue_free()
	if SalesGlobals.sold_to_whore:
		whore.queue_free()
	
	call_deferred("check_all_sold")

extends Button

@export var first_scene: String

func _on_pressed() -> void:
	SalesGlobals.sold_to_baller = false
	SalesGlobals.sold_to_doomer = false
	SalesGlobals.sold_to_whore = false
	
	get_tree().change_scene_to_file(first_scene)

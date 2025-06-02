extends Control

@export var npc_icon: Texture2D;
@export var npc_name: String = "Unknown Character";
@export var npc_dialog: String = "I have nothing to say, you should never see this message."
@export var npc_color: Color = Color.WHITE
@export var next_scene: PackedScene = null
@export var dialog_duration: float = 3.0

@export var npc_icon_node: TextureRect = null
@export var primary_panel: PanelContainer;
@export var npc_icon_panel: PanelContainer;
@export var npc_name_text: RichTextLabel;
@export var npc_dialog_text: RichTextLabel;
@export var animator: AnimationPlayer;

func _ready() -> void:
	npc_icon_node.texture = npc_icon
	
	primary_panel.get("theme_override_styles/panel").set("border_color", npc_color)
	npc_icon_panel.get("theme_override_styles/panel").set("border_color", npc_color)
	npc_name_text.set("theme_override_colors/default_color", npc_color)
	
	npc_name_text.text = npc_name
	npc_dialog_text.text = npc_dialog
	
	animator.speed_scale = 1.0 / dialog_duration

func _input(event: InputEvent) -> void:
	if event.is_action_released("dialog_next"):
		if animator.is_playing():
			animator.seek(1.0)
		else:
			finish_dialog()

func finish_dialog():
	get_tree().change_scene_to_packed(next_scene)

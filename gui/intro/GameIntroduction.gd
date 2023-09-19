extends Control

var main_menu : String = "res://gui/main_menu/MainMenu.tscn"
var changed_scene

func _on_AnimationPlayer_animation_finished(_anim_name):
	changed_scene = get_tree().change_scene(main_menu)

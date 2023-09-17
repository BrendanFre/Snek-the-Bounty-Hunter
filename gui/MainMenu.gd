extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_ExitButton_pressed():
	get_tree().quit()


func _on_StartButton_pressed():
	get_tree().change_scene("res://maps/00/scn_map_00.tscn")


func _on_AnimationPlayer_animation_finished(anim_name):
	print(anim_name)
	if anim_name == "FadeIn":
		$AnimationPlayer/MarginContainer/VBoxContainer/StartButton.grab_focus()

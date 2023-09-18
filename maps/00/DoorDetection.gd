extends Area2D
signal next_scene
export var player : PackedScene

func _on_DoorDetection_body_entered(body):
	if body.has_method("make_priority"):
		print("He has arrived.")
		emit_signal("next_scene")

extends TileMap
export var player : PackedScene
onready var level_entry = $"/root/Progress".level_entry

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var player_instance = player.instance()
	if level_entry == 1:
		player_instance.set_global_position(Vector2(24,60))
		add_child(player_instance)
	elif level_entry == 2:
		player_instance.set_global_position(Vector2(90,60))
		add_child(player_instance)
	else:
		error_handling(level_entry)
		print("Unexpected level_entry " + str(level_entry))
	
func error_handling(level):
	var error_dialog = AcceptDialog.new()
	add_child(error_dialog)
	error_dialog.window_title = "Unexpected Behaviour"
	error_dialog.dialog_text = "The level_entry variable displayed an unexpeced value: " + str(level_entry)
	error_dialog.get_ok().text = "Close"
	error_dialog._set_size(Vector2(100,100))
	error_dialog.set_autowrap(true) 
	error_dialog.popup_centered()

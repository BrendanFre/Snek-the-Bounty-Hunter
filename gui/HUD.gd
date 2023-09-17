extends CanvasLayer
class_name hud
onready var dialog_box : Label = $DialogBox
onready var dialog_db : Node = $DialogBox/DialogDb

# Called when the node enters the scene tree for the first time.
func _ready():
	dialog_box.hide()
	
func dialog_start(index):
	dialog_box.set_text(dialog_db.database_dialog[index])
	dialog_box.show()

func dialog_stop():
	dialog_box.hide()
	get_tree().paused = false

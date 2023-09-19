extends CanvasLayer
class_name hud
onready var dialog_box : Label = $DialogBox
onready var dialog_db : Node = $DialogBox/DialogDb
onready var black_out : ColorRect = $AnimationPlayer/ColorRect
onready var animator : AnimationPlayer = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	black_out.color = Color(7, 24, 33, 0)
	
func dialog_start(index):
	dialog_box.set_text(dialog_db.database_dialog[index])
	dialog_box.show()

func dialog_stop():
	dialog_box.hide()
	get_tree().paused = false
	
func fade_in():
	animator.play("FadeIn")


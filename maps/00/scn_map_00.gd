extends ColorRect
export var player : PackedScene
export var hud_scene : PackedScene
var begin_game : Node
var active_hud
var conversation: int

signal introduction


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$PlayerShip.landing = true
	

func _on_PlayerShip_player_exit():
	var player_scene = player.instance()
	player_scene.set_global_position(Vector2(22, 180))
	add_child(player_scene)
	emit_signal('introduction')
	player_scene.make_priority(0, 256, 256, 0)
	dialog_start()

func dialog_start():
	active_hud = hud_scene.instance()
	add_child(active_hud)
	get_tree().paused = true
	conversation = 1
	active_hud.dialog_start(0)
	

func _process(_delta):
	if Input.is_action_just_released("jump"):
		if conversation == 1:
			active_hud.dialog_start(conversation)
			conversation += 1
		elif conversation == 2:
			active_hud.dialog_start(conversation)
			conversation += 1
		elif conversation == 3:
			active_hud.dialog_stop()
			


func _on_DoorDetection_next_scene():
	if active_hud.has_method("fade_in"):
		print(active_hud.has_method("fade_in"))
		active_hud.has_method("fade_in")

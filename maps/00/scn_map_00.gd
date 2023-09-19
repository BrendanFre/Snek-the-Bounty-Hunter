extends ColorRect
export var player : PackedScene
export var hud_scene : PackedScene
var begin_game : Node
var active_hud
var conversation: int
var at_door: bool
var next_scene : String = "res://maps/01/01-house.tscn"
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
	
	if at_door:
		if Input.is_action_pressed("jump"):
			get_tree().paused
			active_hud.fade_in()
			$"/root/Progress/".level_entry = 1
			get_tree().change_scene(next_scene)
		
			


func _on_DoorDetection_next_scene():
	if active_hud.has_method("fade_in"):
		at_door = true
		


func _on_DoorDetection_body_exited(body):
	at_door = false

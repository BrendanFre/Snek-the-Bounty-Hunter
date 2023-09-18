extends KinematicBody2D
class_name snek
export (int) var speed = 75
export (int) var jump_speed = -250
export (int) var gravity = 1000

var velocity = Vector2.ZERO

func _ready():
	$AnimatedSprite.stop()
	$IdleTimer.start(5)

func make_priority(top_bound, right_bound, bottom_bound, left_bound):
	$Camera2D._set_current(true)
	$Camera2D.limit_left = left_bound
	$Camera2D.limit_right = right_bound
	$Camera2D.limit_bottom = bottom_bound
	$Camera2D.limit_top = top_bound
	
#	self.set_scale(Vector2(2,2))

func get_input():
	velocity.x = 0
	if Input.is_action_pressed("right"):
		velocity.x += speed
		$AnimatedSprite.set_flip_h(false)
		$AnimatedSprite.play("run")
	if Input.is_action_pressed("left"):
		velocity.x -= speed
		$AnimatedSprite.set_flip_h(true)
		$AnimatedSprite.play("run")

	

func _physics_process(delta):
	get_input()
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2.UP)
	if Input.is_action_just_pressed("jump"):
		if is_on_floor():
			velocity.y = jump_speed
	


func _on_IdleTimer_timeout():
	$AnimatedSprite.play("idle")


func _on_AnimatedSprite_animation_finished():
	if $AnimatedSprite.animation == "idle":
		$AnimatedSprite.stop()

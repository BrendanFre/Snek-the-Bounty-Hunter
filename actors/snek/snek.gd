extends KinematicBody2D
class_name snek
var velocity : Vector2
export (int) var speed = 350
export (int) var gravity = 3000
export (int) var jump_speed = 200

func make_priority(top_bound, right_bound, bottom_bound, left_bound):
	$Camera2D._set_current(true)
	$Camera2D.limit_left = left_bound
	$Camera2D.limit_right = right_bound
	$Camera2D.limit_bottom = bottom_bound
	$Camera2D.limit_top = top_bound
	
	self.set_scale(Vector2(2,2))

func get_input():
	velocity = Vector2()
	if Input.is_action_pressed("right"):
		velocity.x += 1
	if Input.is_action_pressed("left"):
		velocity.x -= 1
	velocity = velocity.normalized() * speed

func _physics_process(delta):
	get_input()
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2.UP)
	if Input.is_action_just_pressed("jump"):
		if is_on_floor():
			velocity.y = jump_speed

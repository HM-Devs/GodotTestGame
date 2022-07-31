extends KinematicBody2D

var velocity = Vector2.ZERO
const max_speed = 80
const acceleration = 500
const friction = 500

func _physics_process(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("move_d") - Input.get_action_strength("move_a")
	input_vector.y = Input.get_action_strength("move_s") - Input.get_action_strength("move_w")
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		velocity = velocity.move_toward(input_vector * max_speed, acceleration * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, friction * delta)
	
	velocity = move_and_slide(velocity)
	

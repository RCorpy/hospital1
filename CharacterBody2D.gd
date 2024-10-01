extends CharacterBody2D

const SPEED = 300.0
var targetVector = Vector2(0,0)
var facing = "down"

func _physics_process(delta):
	if velocity.length()<0.01:
		get_animation(facing+"_idle")
	else:
		get_animation(facing)
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.is_action_pressed("click")
	if direction:
		targetVector = get_local_mouse_position()
		if targetVector.length()>10:
			velocity = targetVector.normalized() * SPEED
			if abs(velocity.x) > abs(velocity.y):
				if velocity.x>0: facing = "right"
				else: facing = "left"
			else:
				if velocity.y<0: facing= "up"
				else: facing="down"
		else:
			velocity = Vector2(0,0)
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)
	move_and_slide()

func get_animation(animation):
	$AnimatedBody.animation = str(animation)
	$AnimatedHat.animation = str(animation)
	$AnimatedClothes.animation = str(animation)

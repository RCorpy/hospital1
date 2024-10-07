extends CharacterBody2D

const SPEED = 300.0
var targetVector = Vector2(0,0)
var facing = "down"
var frame_size = Vector2(64, 64)

signal giveCharacterPosition(charPosition)

func _physics_process(delta):
	if $"..".isPlayerMovementEnabled:
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
		emit_signal("giveCharacterPosition", global_position)
	else:
		get_animation(facing+"_idle")
	

func get_animation(animation):
	#print(animation)
	$AnimatedBody.animation = str(animation)
	#$AnimatedHat.animation = str(animation)
	$AnimatedClothes.animation = str(animation)
	$AnimatedHair.animation = str(animation)

func load_all_animations():
	load_one_animation($AnimatedBody, "res://realassets/char/char_a_p1_0bas_humn_v01.png")
	load_one_animation($AnimatedClothes, "res://realassets/char/char_a_p1_1out_alch_v01.png")
	load_one_animation($AnimatedHair, "res://realassets/char/hairs/char_a_p1_4har_bob2_v05.png")
	
func load_one_animation(animated_sprite, this_res_path):
	# Create a new SpriteFrames resource
	var sprite_frames = SpriteFrames.new()
	sprite_frames.add_animation("right")
	load_animation(sprite_frames, "right", [
			Rect2(Vector2(0, 384), frame_size),
			Rect2(Vector2(64, 384), frame_size),
			Rect2(Vector2(128, 384), frame_size),
			Rect2(Vector2(192, 384), frame_size),
			Rect2(Vector2(256, 384), frame_size),
			Rect2(Vector2(320, 384), frame_size),
		], this_res_path)
	sprite_frames.add_animation("right_idle")
	load_animation(sprite_frames, "right_idle", [
		Rect2(Vector2(0, 128), frame_size),
	], this_res_path)
	sprite_frames.add_animation("left")
	load_animation(sprite_frames, "left", [
		Rect2(Vector2(0, 448), frame_size),
		Rect2(Vector2(64, 448), frame_size),
		Rect2(Vector2(128, 448), frame_size),
		Rect2(Vector2(192, 448), frame_size),
		Rect2(Vector2(256, 448), frame_size),
		Rect2(Vector2(320, 448), frame_size),
	], this_res_path)
	sprite_frames.add_animation("left_idle")
	load_animation(sprite_frames, "left_idle", [
		Rect2(Vector2(0, 192), frame_size),
	], this_res_path)
	sprite_frames.add_animation("up")
	load_animation(sprite_frames, "up", [
		Rect2(Vector2(0, 320), frame_size),
		Rect2(Vector2(64, 320), frame_size),
		Rect2(Vector2(128, 320), frame_size),
		Rect2(Vector2(192, 320), frame_size),
		Rect2(Vector2(256, 320), frame_size),
		Rect2(Vector2(320, 320), frame_size),
	], this_res_path)
	sprite_frames.add_animation("up_idle")
	load_animation(sprite_frames, "up_idle", [
		Rect2(Vector2(0, 64), frame_size),
	], this_res_path)
	sprite_frames.add_animation("down")
	load_animation(sprite_frames, "down", [
		Rect2(Vector2(0, 256), frame_size),
		Rect2(Vector2(64, 256), frame_size),
		Rect2(Vector2(128, 256), frame_size),
		Rect2(Vector2(192, 256), frame_size),
		Rect2(Vector2(256, 256), frame_size),
		Rect2(Vector2(320, 256), frame_size),
	], this_res_path)
	sprite_frames.add_animation("down_idle")
	load_animation(sprite_frames, "down_idle", [
		Rect2(Vector2(0, 0), frame_size),
	], this_res_path)
	# Assign the SpriteFrames resource to the AnimatedSprite2D node
	animated_sprite.frames = sprite_frames
	animated_sprite.play("left")
	
	print("at", animated_sprite)

func load_animation(sprite_frames, name, regions, res_path):
	var sprite_sheet = load(res_path)

# Iterate over each region and add it as a frame to the animation
	for region in regions:
		var atlas_texture = AtlasTexture.new()
		atlas_texture.atlas = sprite_sheet  # Set the sprite sheet as the base texture
		atlas_texture.region = region
		sprite_frames.add_frame(name, atlas_texture)

func _on_ready():
	load_all_animations()


extends Node2D

var isPlayerMovementEnabled = true
signal giveCharPosition(charPos)


func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_ui_enable_movement(isTrue):
	isPlayerMovementEnabled = isTrue


func _on_character_body_2d_give_character_position(charPosition):
	emit_signal("giveCharPosition", charPosition)

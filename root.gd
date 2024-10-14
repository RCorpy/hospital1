extends Node2D

var halfWidth = 0
var halfHeight = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	var viewportSize = get_viewport().get_visible_rect().size
	halfWidth = viewportSize.x/2
	halfHeight = viewportSize.y/2

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_protagonist_give_char_position(charPos):
	$Camera2D.global_position = charPos
	$UI.global_position = charPos - Vector2(halfWidth, halfHeight)
	


func _on_bed_bed_entered(bedNumber):
	$UI.showHealMenu(true)


func _on_bed_bed_exited(bedNumber):
	$UI.showHealMenu(false)

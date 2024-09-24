extends Node2D


var width 
var height
signal changeItem(itemNumber) 
# Called when the node enters the scene tree for the first time.
func _ready():
	var texture_size = %highlighter.texture.get_size()
	width = texture_size.x +2
	height = texture_size.y
	populateItems()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func populateItems():
	pass

func _on_button_1_pressed():
	%highlighter.position = $Button1.position + Vector2(width,height)
	emit_signal("changeItem", 1)
	print(width, height)


func _on_button_2_pressed():
	%highlighter.position = $Button2.position + Vector2(width,height)
	emit_signal("changeItem", 2)

func _on_button_3_pressed():
	%highlighter.position = $Button3.position + Vector2(width,height)
	emit_signal("changeItem", 3)
	

func _on_button_4_pressed():
	%highlighter.position = $Button4.position + Vector2(width,height)
	emit_signal("changeItem", 4)


func _on_button_5_pressed():
	%highlighter.position = $Button5.position + Vector2(width,height)
	emit_signal("changeItem", 5)


func _on_button_6_pressed():
	%highlighter.position = $Button6.position + Vector2(width,height)
	emit_signal("changeItem", 6)

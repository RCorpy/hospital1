extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	updateBar("yellow", 50)
	updateBar("red", 80)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func updateBar(color, value):
	var colorInitial
	
	if color == "red": colorInitial = "r"
	else: colorInitial = "y"
	var combined_string= "r1"
	var isVisible = true
	for i in range(10):
		combined_string = "%s%d" % [colorInitial, i+1]
		if i*10 < value:
			print(combined_string)
			%progressbars.get_node(combined_string).visible = true
		else:
			%progressbars.get_node(combined_string).visible = false

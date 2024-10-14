extends StaticBody2D

signal bed_entered(bedNumber)
signal bed_exited(bedNumber)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_bed_body_entered(body):
	if body.name == "Player":
		
		emit_signal("bed_entered", 1)


func _on_area_bed_body_exited(body):
	if body.name == "Player":
		emit_signal("bed_exited", 1)

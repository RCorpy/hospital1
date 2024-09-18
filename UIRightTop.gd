extends Button

signal enablecontrols(isTrue)


func _ready():
	pass # Replace with function body.

func _process(delta):
	pass


func _on_pressed():
	%SettingsMenu.visible = true
	emit_signal("enablecontrols", false)


func go_back_to_game():
	%SettingsMenu.visible = false
	emit_signal("enablecontrols", true)


func _on_button_back_pressed():
	go_back_to_game()

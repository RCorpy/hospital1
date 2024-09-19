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


func _on_back_button_pressed():
	$SettingsMenu/MainSettings.visible = true
	$SettingsMenu/Option1.visible = false


func _on_option_1_button_pressed():
	$SettingsMenu/MainSettings.visible = false
	$SettingsMenu/Option1.visible = true

func _on_volume_value_changed(value):
	pass # Replace with function body.

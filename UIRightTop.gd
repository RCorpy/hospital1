extends Button

signal enablecontrols(isTrue)


func _ready():
	#set the volvalue to match the real value
	#TranslationServer.set_locale("es")
	$SettingsMenu/Option1/VolValue.text = str($SettingsMenu/Option1/Volume.value)
	translate()
func _process(delta):
	pass


func translate():
	$SettingsMenu/MainSettings/Option1Button/Label.text = tr("Option1")
	$SettingsMenu/MainSettings/Option2Button/Label.text = tr("Option2")
	$SettingsMenu/MainSettings/Option3Button/Label.text = tr("Option3")
	$SettingsMenu/MainSettings/ButtonBack/Label.text = tr("Back")
	$SettingsMenu/Option1/Label.text = tr("Volume")
	$SettingsMenu/Option1/BackButton/Label.text = tr("Back")
	$SettingsMenu/Option2/BackButton/Label.text = tr("Back")
	
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
	$SettingsMenu/Option2.visible = false


func _on_option_1_button_pressed():
	$SettingsMenu/MainSettings.visible = false
	$SettingsMenu/Option1.visible = true
	$SettingsMenu/Option2.visible = false

func _on_option_2_button_pressed():
	$SettingsMenu/MainSettings.visible = false
	$SettingsMenu/Option1.visible = false
	$SettingsMenu/Option2.visible = true

func _on_volume_value_changed(value):
	$SettingsMenu/Option1/VolValue.text = str(value)
	#cambiar volumen del juego


func _on_spanish_button_pressed():
	TranslationServer.set_locale("es")
	translate()


func _on_english_button_pressed():
	TranslationServer.set_locale("en")
	translate()



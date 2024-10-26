extends Node2D

signal save
signal enableMovement(isTrue)
signal heal_patient(treatment)
var selectedItem = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_option_3_button_pressed(): #save button
	emit_signal("save")
	%Popup.visible = true


func _on_ui_right_top_signal_translate():
	$Popup/ContinueButton/Label.text = tr("Back")
	$Popup/Label.text = tr("Saved")
	$ItemHolder/UseLabel.text = tr("Use")


func _on_use_button_pressed():
	emit_signal("heal_patient", selectedItem)
	#use patient function for the bed that root currently_touching is saying

func _on_item_holder_change_item(itemNumber):
	selectedItem = itemNumber


func _on_ui_right_top_enablecontrols(isTrue):
	emit_signal("enableMovement", isTrue)

func showHealMenu(show):
	$ItemHolder.visible = show

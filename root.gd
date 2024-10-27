extends Node2D

var halfWidth = 0
var halfHeight = 0
var currently_touching = "none"
var patient_number = 0

var player_exp = 0
var player_money = 0

var patient_scene = preload("res://patient.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	var viewportSize = get_viewport().get_visible_rect().size
	halfWidth = viewportSize.x/2
	halfHeight = viewportSize.y/2
	update_stats_on_UI()
	make_new_patient()
	make_new_patient()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not currently_touching == "none":
		for child_node in get_children():
			if "Patient" in child_node.name:
				if child_node.bed_name == currently_touching:
					$UI.updateRedBar(child_node.patient_health) #show this on bar
	else:
		#show empty or full bar
		$UI.updateRedBar(100)


func _on_protagonist_give_char_position(charPos):
	$Camera2D.global_position = charPos
	$UI.global_position = charPos - Vector2(halfWidth, halfHeight)
	


func _on_bed_bed_entered(bed_name):
	$UI.showHealMenu(true)
	currently_touching = bed_name


func _on_bed_bed_exited(bed_name):
	$UI.showHealMenu(false)
	currently_touching = "none"

func get_next_bed(): 
	var beds = 0
	for child_node in get_children():
		
		if "Bed" in child_node.name:
			if not child_node.is_occupied:
				print(child_node.name)
				#child_node.is_occupied = true
				return child_node.name
	return false
	
	
func make_new_patient():
	var next_bed = get_next_bed()
	#do we have spare bed?
	if next_bed:
		#create Patient node
		var new_instance = patient_scene.instantiate()
		new_instance.name = "Patient" + str(patient_number)
		patient_number += 1
		add_child(new_instance)
		#choose illness
		#choose health
		#choose name
		#choose clothes
		


func _on_ui_heal_patient(treatment):

	if not currently_touching == "none":
		#look the patient in the bed
		for child_node in get_children():
			if "Patient" in child_node.name:
				if child_node.bed_name == currently_touching:
					child_node.try_recieve_treatment(treatment)
		pass

func give_rewards():
	player_money += 1000
	player_exp += 10
	update_stats_on_UI()

func update_stats_on_UI():
	$UI.update_stats(player_money, player_exp)

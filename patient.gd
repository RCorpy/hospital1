extends Node2D

enum Patient_state {ENTERING, ONBED, EXITING}
enum Illness {BRUISE, CRY, FEVER, STOMACHACHE, DIRTY, SLEEPY}

@export var patient_name: String = ""
@export var patient_illness: Illness = Illness.BRUISE
@export var bed_name: String = ""

@export var patient_health: int = 50

const MAX_HEALTH: int = 100
const TREATMENT_CD: float = 10.0
var treatment_can_run = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func patient_health_increase(amount):
	patient_health = min(MAX_HEALTH, patient_health + amount)

func start_treatment_cd():
	treatment_can_run = false
	await get_tree().create_timer(TREATMENT_CD).timeout
	treatment_can_run = true

func try_recieve_treatment(treatment):
	if treatment_can_run:
		recieve_treatment(treatment)
		start_treatment_cd()
	else:
		print("treatment on CD")

func recieve_treatment(treatment):
	#always -> small heal
	patient_health_increase(10)
	var treatment_for_illness = ""
	match treatment:
		1:
			treatment_for_illness = Illness.BRUISE
		2:
			treatment_for_illness = Illness.CRY
		3:
			treatment_for_illness = Illness.DIRTY
		4:
			treatment_for_illness = Illness.STOMACHACHE
		5:
			treatment_for_illness = Illness.FEVER
		6:
			treatment_for_illness = Illness.SLEEPY
	#if correct treatment -> more heal
	if patient_illness == treatment_for_illness:
		patient_health_increase(20)
	#if heal is 100-> completed, go home, get money and exp
	if patient_health >= 100:
		$Miguel.patient_status = Patient_state.EXITING
	
	#disallow treatment for 10 sec (on root.gd)
	print("healing", treatment)
	pass
	

func get_bed_position():
	bed_name = get_parent().get_next_bed()
	
	match bed_name:
		"Bed1":
			$"../Bed1".is_occupied = true
			return $"../Bed1".global_position
		"Bed2":
			$"../Bed2".is_occupied = true
			return $"../Bed2".global_position
		"Bed3":
			$"../Bed3".is_occupied = true
			return $"../Bed3".global_position
		false:
			return false


func _on_miguel_rewards():
	get_parent().give_rewards()

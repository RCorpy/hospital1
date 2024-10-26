extends Node2D

enum Patient_state {ENTERING, ONBED, EXITING}
enum Illness {BRUISE, CRY, FEVER, STOMACHACHE, DIRTY, WOUND}

@export var patient_name: String = ""
@export var patient_illness: Illness = Illness.BRUISE
@export var bed_name: String = ""
@export var patient_status: Patient_state = Patient_state.ENTERING
@export var patient_health: int = 50

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func recieve_treatment(treatment):
	
	#always -> small heal
	#if correct treatment -> more heal
	#if heal is 100-> completed, go home, get money and exp
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

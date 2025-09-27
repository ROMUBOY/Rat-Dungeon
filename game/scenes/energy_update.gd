extends Node2D


@onready var progress_bar: ProgressBar = $Control/VBoxContainer/HBoxContainer/ProgressBar
@onready var food_aquired_number: Label = $Control/VBoxContainer/HBoxContainer2/FoodAquiredNumber
@onready var rooms_explored: Label = $Control/VBoxContainer/HBoxContainer3/RoomsExplored

var food_aquired: float
var timer: int = 30

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	progress_bar.value = Globals.current_energy
	food_aquired_number.text = str(int(Globals.energy_aquired))
	food_aquired = Globals.energy_aquired
	
	Globals.update_energy()
	
	rooms_explored.text = str(Globals.rooms_explored)

func _process(delta: float) -> void:
	if timer > 0:
		timer -= 1
		return
	
	UpdateProgressBar()

func UpdateProgressBar():
	if progress_bar.value >= 20 or food_aquired <= 0:
		food_aquired = 0
		food_aquired_number.text = str(int(food_aquired))
		return
	
	progress_bar.value += 0.1 
	food_aquired -= 0.1 	
	food_aquired_number.text = str(int(food_aquired))

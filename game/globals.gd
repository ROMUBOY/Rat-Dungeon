extends Node

var current_energy: float = 0
var energy_aquired: float = 0
var rooms_explored: int = 0
var highscore: int = 0

func update_energy():
	current_energy += energy_aquired
	energy_aquired = 0
	rooms_explored += 1
	if current_energy > 20:
		current_energy = 20

func reset_globals():
	current_energy = 0
	energy_aquired = 0
	rooms_explored = 0

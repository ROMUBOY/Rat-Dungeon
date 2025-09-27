extends CharacterBody2D
class_name Player

@export var max_energy: float = 20

var current_energy: float

@onready var current_energy_progress_bar: ProgressBar = $Camera2D/Control/VBoxContainer/HBoxContainer/ProgressBar

const SPEED = 300.0

func _ready() -> void:
	current_energy = Globals.current_energy
	current_energy_progress_bar.value = current_energy

func _physics_process(delta):
	motion_mode = 1
	var input_vector = Vector2(Input.get_axis("ui_left", "ui_right"), Input.get_axis("ui_up", "ui_down"))
	input_vector = input_vector.normalized()
	velocity = input_vector * SPEED

	move_and_slide()

func _process(delta: float) -> void:
	current_energy -= delta
	current_energy_progress_bar.value = current_energy

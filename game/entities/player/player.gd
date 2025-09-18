extends CharacterBody2D
class_name Player
const SPEED = 300.0

func _physics_process(delta):
	motion_mode = 1
	var input_vector = Vector2(Input.get_axis("ui_left", "ui_right"), Input.get_axis("ui_up", "ui_down"))
	input_vector = input_vector.normalized()
	velocity = input_vector * SPEED

	move_and_slide()

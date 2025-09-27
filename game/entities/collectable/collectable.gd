extends Area2D
class_name Collectable

@export var value: float = 1

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		Globals.energy_aquired += value
		queue_free()

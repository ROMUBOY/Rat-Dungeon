extends Area2D

signal leaving_level

func _on_body_entered(body):
	if body is Player:
		emit_signal("leaving_level")

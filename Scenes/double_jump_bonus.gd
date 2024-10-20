extends "res://Scripts/bonus.gd"

func apply_bonus(body: Node2D):
	body.can_double_jump = true


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		apply_bonus(body)
		queue_free()

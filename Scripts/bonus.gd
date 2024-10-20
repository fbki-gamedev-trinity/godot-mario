extends Area2D

func _ready():
	if not $CollisionShape2D:
		print("CollisionShape2D не найден!")


func apply_bonus(_body: Node2D):
	pass

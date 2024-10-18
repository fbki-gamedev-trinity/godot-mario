
extends AnimatedSprite2D

class_name PlayerAnimatedSprite

func trigger_animation(velocity: Vector2, direction: int):
	if not get_parent().is_on_floor():
		play("jump")
	elif sign(velocity.x) != sign(direction) && velocity.x != 0 && direction != 0:
		play("slide")
		scale.x = direction
	else:
		if sign(velocity.x) == -1:
			scale.x = -1
		else:
			scale.x = 1

		if velocity.x != 0:
			play("run")
		else:
			play("idle")

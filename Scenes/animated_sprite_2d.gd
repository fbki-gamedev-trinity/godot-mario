extends AnimatedSprite2D
#
#class_name PlayerAnimatedSprite
#
#var frame_count = 0
#func trigger_animation(velocity: Vector2, direction: int):
	#if not get_parent().is_on_floor():
		#play("%jump")
	#
	##handle slide animations
	#elif sign(velocity.x) != sign(direction) && velocity.x != 0 && direction != 0:
		#play("%s_slide" % animation_prefix)
		#scale.x = direction
	#else:
	## handle the sprite direction
		#if scale.x == 1 && sign(velocity.x) == -1:
			#scale.x = -1
		#elif scale.x == -1 && sign(velocity.x) == 1:
			#scale.x = 1
		#
		## handle run and idle animations
		#if velocity.x != 0:
			#play("%s_run" % animation_prefix)
		#else:
			#play("%s_idle" % animation_prefix)

extends StaticBody2D

var hits_needed = 2
var current_hits = 0

var animated_sprite: AnimatedSprite2D

func _ready():
	animated_sprite = $AnimatedSprite2D
	add_to_group("breakable_blocks")

func on_player_jump():
	# Увеличиваем счетчик ударов
	print_debug('on_player_jump')
	current_hits += 1
	
	if current_hits == 1:
		# Меняем кадр на потресканный
		animated_sprite.frame = 1
	elif current_hits >= hits_needed:
		# Уничтожаем блок
		queue_free()

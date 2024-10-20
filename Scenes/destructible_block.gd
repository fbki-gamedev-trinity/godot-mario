extends StaticBody2D

var hits_needed = 2
var current_hits = 0

var animated_sprite: AnimatedSprite2D
var particles = preload("res://Scenes/particles_2d.tscn")

func _ready():
	animated_sprite = $AnimatedSprite2D
	add_to_group("breakable_blocks")

func on_player_jump():
	# Увеличиваем счетчик ударов
	current_hits += 1
	
	if current_hits == 1:
		# Меняем кадр на потресканный
		animated_sprite.frame = 1
	elif current_hits >= hits_needed:
		print_debug('on_player_jump')
		var particles_instance = particles.instantiate()
		particles_instance.position = position  # Устанавливаем позицию частиц
		get_parent().add_child(particles_instance)  # Добавляем в родительский узел
		particles_instance.emitting = true
		queue_free()

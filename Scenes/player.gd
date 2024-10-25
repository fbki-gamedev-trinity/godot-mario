extends CharacterBody2D

const SPEED = 100.0
const JUMP_VELOCITY = -400.0
const RUN_SPEED_DAMPING = 0.5

var animated_sprite: AnimatedSprite2D
var tilemap

var jump_count: int = 0
const MAX_JUMPS: int = 2
var can_double_jump: bool = false
var dust_effect: PackedScene = preload("res://Scenes/dust.tscn")

func _ready():
	animated_sprite = $AnimatedSprite2D
	tilemap = $"../TileMapLayer"
	add_to_group("player")

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("up"):
		if is_on_floor():
			velocity.y = JUMP_VELOCITY
			jump_count = 1
		elif jump_count < MAX_JUMPS and can_double_jump:
			velocity.y = JUMP_VELOCITY
			jump_count += 1
			dust_cloud()

	var direction := Input.get_axis("left", "right")
	if direction != 0:
		velocity.x = clamp(velocity.x + direction * SPEED * delta, -SPEED, SPEED)
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED * delta)

	animated_sprite.trigger_animation(velocity, direction)
	
	move_and_slide()

func dust_cloud():
	var dust_instance = dust_effect.instantiate()
	dust_instance.position = position
	get_parent().add_child(dust_instance)


func _on_area_2d_body_entered(body: Node2D) -> void:
	print_debug(body)
	if body.is_in_group("enemies"):
		die()
	elif body.is_in_group("breakable_blocks"):
		body.on_player_jump()
		
func die():
	Global.player_lives -= 1
	if(Global.player_lives > 0):
		get_tree().reload_current_scene()
	else:
		get_tree().change_scene_to_file("res://Scenes/game_over_screen.tscn")

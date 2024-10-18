extends CharacterBody2D

const SPEED = 100.0
const JUMP_VELOCITY = -400.0
const RUN_SPEED_DAMPING = 0.5

var animated_sprite: AnimatedSprite2D

func _ready():
	animated_sprite = $AnimatedSprite2D
	add_to_group("player")

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("up") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var direction := Input.get_axis("left", "right")
	if direction != 0:
		velocity.x = clamp(velocity.x + direction * SPEED * delta, -SPEED, SPEED)
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED * delta)

	animated_sprite.trigger_animation(velocity, direction)
	
	move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemies"):
		die()
		
func die():
	Global.player_lives -= 1
	if(Global.player_lives > 0):
		get_tree().reload_current_scene()
	else:
		get_tree().change_scene_to_file("res://Scenes/game_over_screen.tscn")

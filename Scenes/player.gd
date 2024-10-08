extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const run_speed_damping = 0.5

var animated_sprite: AnimatedSprite2D
func _ready():
	animated_sprite = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("up") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		animated_sprite.play("jump")

	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = lerpf(velocity.x, SPEED * direction, run_speed_damping * delta)
		animated_sprite.play("run")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED * delta)
		animated_sprite.play("slide")
		
	move_and_slide()

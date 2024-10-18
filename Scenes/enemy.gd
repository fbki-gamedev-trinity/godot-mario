extends CharacterBody2D


const SPEED = 20
var direction = 1 
var start_position: Vector2
var end_position: Vector2
const MOVE_DISTANCE = 50.0

func _ready() -> void:
	start_position = position
	add_to_group("enemies")
	
func _physics_process(delta: float) -> void:
	velocity += get_gravity() * delta
	
	velocity.x = SPEED * direction

	if position.x >= start_position.x + MOVE_DISTANCE:
		direction = -1 
	elif position.x <= start_position.x - MOVE_DISTANCE:
		direction = 1

	move_and_slide()

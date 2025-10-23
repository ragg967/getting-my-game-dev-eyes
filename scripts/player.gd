extends CharacterBody2D
class_name Player

const SPEED: float = 200.0
const JUMP_VELOCITY: float = -300.0

const LEFT: String = "Left"
const RIGHT: String = "Right"
const UP: String = "Up"
const DOWN: String = "Down"
const JUMP: String = "Jump"

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed(JUMP) and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction: float = Input.get_axis(LEFT, RIGHT)
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

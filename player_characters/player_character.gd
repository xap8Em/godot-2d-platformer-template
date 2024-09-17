extends CharacterBody2D


const MOVEMENT_SPEED: float = 300.0
const MOVEMENT_ACCEL: float = 1200.0
const JUMP_SPEED: float = 400.0


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("jump") and is_on_floor():
		velocity.y = -JUMP_SPEED


func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	var input_movement_axis: float = Input.get_axis("move_left", "move_right")

	velocity.x = move_toward(velocity.x,
			input_movement_axis * MOVEMENT_SPEED, MOVEMENT_ACCEL * delta)

	move_and_slide()

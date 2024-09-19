extends "res://player_characters/states/on_floor/on_floor.gd"


func physics_process(delta: float) -> void:
	super(delta)

	if not is_zero_approx(_player_character.get_input_movement_axis()):
		if Input.is_action_pressed("dash"):
			exiting.emit("dashing")

			return

		exiting.emit("walking")

		return

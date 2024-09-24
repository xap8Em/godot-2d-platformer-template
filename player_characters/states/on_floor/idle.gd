extends "res://player_characters/states/on_floor/on_floor.gd"


func physics_process(delta: float) -> void:
	super(delta)

	if not is_zero_approx(Input.get_axis("move_left", "move_right")):
		if Input.is_action_pressed("dash"):
			exiting.emit("dashing")

			return

		exiting.emit("walking")

		return

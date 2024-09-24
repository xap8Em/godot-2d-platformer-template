extends "res://player_characters/states/state.gd"


func physics_process(delta: float) -> void:
	super(delta)

	_player_character.fall(delta)

	if _player_character.is_on_floor():
		if _player_character.get_real_velocity().is_zero_approx():
			exiting.emit("idle")

			return

		if Input.is_action_pressed("dash"):
			exiting.emit("dashing")

			return

		exiting.emit("walking")

		return

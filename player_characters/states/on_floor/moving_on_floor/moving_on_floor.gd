extends "res://player_characters/states/on_floor/on_floor.gd"


func physics_process(delta: float) -> void:
	super(delta)

	if (
		_player_character.get_real_velocity().is_zero_approx()
		and is_zero_approx(_player_character.get_input_movement_axis())
	):
		exiting.emit("idle")

		return

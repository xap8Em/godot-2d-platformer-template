extends "res://player_characters/states/on_floor/on_floor.gd"


func physics_process(delta: float) -> void:
	super(delta)

	if (
		_player_character.get_real_velocity().is_zero_approx()
		and is_zero_approx(Input.get_axis("move_left", "move_right"))
	):
		exiting.emit("idle")

		return

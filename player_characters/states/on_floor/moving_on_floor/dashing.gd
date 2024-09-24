extends "res://player_characters/states/on_floor/moving_on_floor/moving_on_floor.gd"


func enter() -> void:
	super()

	_player_character.start_dashing()


func unhandled_input(event: InputEvent) -> void:
	super(event)

	if event.is_action_released("dash"):
		exiting.emit("walking")

		return


func physics_process(delta: float) -> void:
	super(delta)

	_player_character.dash(delta)

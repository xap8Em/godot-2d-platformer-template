extends "res://player_characters/states/on_floor/moving_on_floor/moving_on_floor.gd"


func enter() -> void:
	super()

	_player_character.set_movement_speed(_player_character.DASH_SPEED)


func unhandled_input(event: InputEvent) -> void:
	super(event)

	if event.is_action_released("dash"):
		exiting.emit("walking")

		return

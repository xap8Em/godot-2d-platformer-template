extends "res://player_characters/states/state.gd"


func unhandled_input(event: InputEvent) -> void:
	super(event)

	if event.is_action_pressed("jump"):
		exiting.emit("jumping")

		return

	if not _player_character.is_on_floor():
		exiting.emit("falling")

		return

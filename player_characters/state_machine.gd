extends StateMachine


func _init(player_character: PlayerCharacter) -> void:
	_add_state(
			"falling",
			preload(
					"res://player_characters/states/in_air/falling.gd"
			).new(player_character)
	)
	_add_state(
			"jumping",
			preload(
					"res://player_characters/states/in_air/jumping.gd"
			).new(player_character)
	)
	_add_state(
			"moving",
			preload(
					"res://player_characters/states/on_floor/moving.gd"
			).new(player_character)
	)
	_add_state(
			"idle",
			preload(
					"res://player_characters/states/on_floor/idle.gd"
			).new(player_character)
	)

	super("idle")

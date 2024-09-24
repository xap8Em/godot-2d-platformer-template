extends State


var _player_character: PlayerCharacter


func _init(player_character: PlayerCharacter) -> void:
	_player_character = player_character


func physics_process(delta: float) -> void:
	_player_character.move_on_ground(delta)

	_player_character.move_and_slide()

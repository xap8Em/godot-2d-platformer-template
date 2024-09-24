class_name PlayerCharacter
extends CharacterBody2D


const WALKING_SPEED: float = 200.0
const DASH_SPEED: float = 400.0
const MOVEMENT_ACCEL: float = 1200.0
const JUMP_SPEED: float = 400.0

var _state_machine: StateMachine
var _horizontal_movement_speed: float


func _init() -> void:
	_state_machine = preload("res://player_characters/state_machine.gd").new(self)

	_state_machine.current_state_changed.connect(_on_current_state_changed)


func _unhandled_input(event: InputEvent) -> void:
	_state_machine.unhandled_input(event)


func _physics_process(delta: float) -> void:
	_state_machine.physics_process(delta)


func start_walking() -> void:
	_horizontal_movement_speed = WALKING_SPEED


func walk(delta: float):
	_move_horizontally(delta)


func start_dashing() -> void:
	_horizontal_movement_speed = DASH_SPEED


func dash(delta: float):
	_move_horizontally(delta)


func jump() -> void:
	velocity.y = -JUMP_SPEED


func fall(delta: float) -> void:
	velocity += get_gravity() * delta

	_move_horizontally(delta)


func _move_horizontally(delta: float) -> void:
	var input_movement_axis: float = Input.get_axis("move_left", "move_right")

	velocity.x = move_toward(
			velocity.x,
			input_movement_axis * _horizontal_movement_speed,
			MOVEMENT_ACCEL * delta
	)


func _on_current_state_changed(current_state_name: StringName) -> void:
	DebugMenu.set_info_value("player_character/state", current_state_name)

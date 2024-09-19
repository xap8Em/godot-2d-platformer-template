class_name PlayerCharacter
extends CharacterBody2D


const WALKING_SPEED: float = 200.0
const DASH_SPEED: float = 400.0
const MOVEMENT_ACCEL: float = 1200.0
const JUMP_SPEED: float = 400.0

var _state_machine: StateMachine
var _input_movement_axis: float
var _movement_speed: float


func _init() -> void:
	_state_machine = preload("res://player_characters/state_machine.gd").new(self)


func _unhandled_input(event: InputEvent) -> void:
	_state_machine.unhandled_input(event)


func _physics_process(delta: float) -> void:
	_state_machine.physics_process(delta)


func apply_movement_velocity(delta: float) -> void:
	_input_movement_axis = Input.get_axis("move_left", "move_right")

	velocity.x = move_toward(velocity.x,
			_input_movement_axis * _movement_speed, MOVEMENT_ACCEL * delta)


func apply_jump_velocity() -> void:
	velocity.y = -JUMP_SPEED


func apply_falling_velocity(delta: float) -> void:
	velocity += get_gravity() * delta


func get_input_movement_axis() -> float:
	return _input_movement_axis


func set_movement_speed(value: float) -> void:
	_movement_speed = value

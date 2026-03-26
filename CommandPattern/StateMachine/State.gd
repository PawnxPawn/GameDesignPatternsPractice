class_name State extends RefCounted


var state_name: StringName = &""

var _sm: StateMachine
var _owner: Node


func _init(name:StringName) -> void:
	state_name = name


func _setup(sm: StateMachine, parent: Node) -> void:
	_sm = sm
	_owner = parent


func enter() -> void:
	pass


func exit() -> void:
	pass


func process_input(_event: InputEvent) -> void:
	pass


func process_frame(_delta: float) -> void:
	pass


func process_physics(_delta: float) -> void:
	pass


func transition_to(name: StringName) -> void:
	_sm.change_state(name)

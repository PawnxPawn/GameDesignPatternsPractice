class_name StateMachine extends Node


signal state_changed(from_state: State, to_state: State)

var _states: Dictionary = {}
var _current_state: State = null
var _last_state: State = null
var _is_transitioning: bool = false

var current_state: State:
	get: return _current_state

var last_state: State:
	get: return _last_state



func init(parent: Node, states: Array[State], initial_state: StringName = &"") -> void:
	for state in states:
		if state.state_name == &"":
			push_error("StateMachine: a state has no state_name set: %s" % state)
			continue
		if _states.has(state.state_name):
			push_error("StateMachine: duplicate state_name '%s'." % state.state_name)
			continue
		_states[state.state_name] = state
		state._setup(self, parent)

	var start := initial_state
	if start == &"" and not _states.is_empty():
		start = _states.keys()[0] as StringName

	if start != &"":
		change_state(start)


func change_state(state_name: StringName) -> void:
	if _is_transitioning:
		push_warning("StateMachine: change_state('%s') called during a transition." % state_name)
		return

	if not _states.has(state_name):
		push_error("StateMachine: state '%s' not found." % state_name)
		return

	var new_state: State = _states[state_name]
	_is_transitioning = true

	if _current_state:
		_current_state.exit()

	_last_state = _current_state
	_current_state = new_state
	_is_transitioning = false

	state_changed.emit(_last_state, _current_state)
	_current_state.enter()


func _unhandled_input(event: InputEvent) -> void:
	if _current_state:
		_current_state.process_input(event)


func _process(delta: float) -> void:
	if _current_state:
		_current_state.process_frame(delta)


func _physics_process(delta: float) -> void:
	if _current_state:
		_current_state.process_physics(delta)

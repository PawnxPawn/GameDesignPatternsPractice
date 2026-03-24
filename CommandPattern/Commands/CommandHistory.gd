class_name CommandHistory extends RefCounted

const _MAX_HISTORY:int = 50

var _history: Array[Command] = []
var _redo_stack: Array[Command] = []

func execute_command(command: Command) -> void:
	command.execute()
	_history.append(command)
	_redo_stack.clear()
	
	if _history.size() <= _MAX_HISTORY: return
	_history.pop_front()


func undo() -> void:
	if _history.is_empty(): return
	var command = _history.pop_back()
	command.unexecute()
	_redo_stack.append(command)


func redo() -> void:
	if _redo_stack.is_empty(): return
	var command = _redo_stack.pop_back()
	command.execute()
	_history.append(command)


func clear() -> void:
	_history.clear()
	_redo_stack.clear()

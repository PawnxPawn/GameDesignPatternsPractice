class_name InputComponent extends Component

signal move_requested(direction: Vector2i)
signal undo_requested
signal redo_requested

func update(_delta: float) -> void:
	if Input.is_action_just_pressed("WalkUp"):
		move_requested.emit(Vector2i(0,-1))
	elif Input.is_action_just_pressed("WalkDown"):
		move_requested.emit(Vector2i(0,1))
	elif Input.is_action_just_pressed("WalkLeft"):
		move_requested.emit(Vector2i(-1,0))
	elif Input.is_action_just_pressed("WalkRight"):
		move_requested.emit(Vector2i(1,0))
	elif Input.is_action_just_pressed("Undo"):
		undo_requested.emit()
	elif Input.is_action_just_pressed("Redo"):
		redo_requested.emit()

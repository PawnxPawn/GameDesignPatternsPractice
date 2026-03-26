class_name PlayerIdleState extends State

var _player: Player
var _input: InputComponent
var _animation: AnimationComponent


func _setup(sm: StateMachine, parent: Node) -> void:
	super(sm, parent)
	_player = parent as Player
	_input = _player.get_component(InputComponent) as InputComponent
	_animation = _player.get_component(AnimationComponent) as AnimationComponent


func enter() -> void:
	_animation.play_idle()


func process_frame(_delta: float) -> void:
	if not _input: return

	var dir: Vector2i = _input.get_move_direction()
	if dir != Vector2i.ZERO:
		_player.request_move(dir)
		return

	if _input.is_undo_pressed():
		_player.request_undo()
	elif _input.is_redo_pressed():
		_player.request_redo()

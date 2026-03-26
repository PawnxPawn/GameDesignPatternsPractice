class_name PlayerWalkState extends State

var _player: Player
var _move: MoveComponent
var _animation: AnimationComponent


func _setup(sm: StateMachine, parent: Node) -> void:
	super(sm, parent)
	_player = parent as Player
	_move = _player.get_component(MoveComponent) as MoveComponent
	_animation = _player.get_component(AnimationComponent) as AnimationComponent


func enter() -> void:
	_animation.animation_finished.connect(_on_animation_finished, CONNECT_ONE_SHOT)
	_animation.play_walk(_move.last_direction)


func exit() -> void:
	if _animation.animation_finished.is_connected(_on_animation_finished):
		_animation.animation_finished.disconnect(_on_animation_finished)


func _on_animation_finished(_anim_name: StringName) -> void:
	transition_to(&"Idle")

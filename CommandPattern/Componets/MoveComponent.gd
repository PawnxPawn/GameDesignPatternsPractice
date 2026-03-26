class_name MoveComponent extends Component

const MOVE_DURATION: float = 0.35

var grid_position: Vector2i
var last_direction: Vector2i = Vector2i(0, 1)

var _tween: Tween

var is_reverse:bool = false
var end_facing: Vector2i = Vector2i.ZERO


func on_bind() -> void:
	grid_position = Vector2i(_actor.position)


func move_to(target: Vector2i, world_pos: Vector2, direction: Vector2i) -> void:
	last_direction = direction
	grid_position = target

	if _tween and _tween.is_running():
		_tween.kill()

	_tween = _actor.create_tween()
	_tween.tween_property(_actor, "position", world_pos, MOVE_DURATION)

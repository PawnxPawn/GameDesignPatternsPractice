class_name MoveCommand extends Command

var _actor: Node2D
var _from: Vector2i
var _to: Vector2i
var _direction: Vector2i
var _prev_facing: Vector2i
var _event_bus: EventBus

func _init(actor:Node2D, from:Vector2i, to:Vector2i, direction: Vector2i, prev_facing:Vector2i, event_bus: EventBus) -> void:
	_actor = actor
	_from = from
	_to = to
	_direction = direction
	_prev_facing = prev_facing
	_event_bus = event_bus


func execute() -> void:
	_actor.move_to(_to, _direction, false, _direction)
	_event_bus.player_moved.emit(_from, _to)


func unexecute() -> void:
	_actor.move_to(_from, _direction, true, _prev_facing)

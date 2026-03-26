class_name MoveCommand extends Command

var _actor: Node2D
var _from: Vector2i
var _to: Vector2i
var _event_bus: EventBus

func _init(actor:Node2D, from:Vector2i, to:Vector2i, event_bus: EventBus) -> void:
	_actor = actor
	_from = from
	_to = to
	_event_bus = event_bus


func execute() -> void:
	_actor.move_to(_to, _to - _from)
	_event_bus.player_moved.emit(_from, _to)


func unexecute() -> void:
	_actor.move_to(_from, _from - _to)

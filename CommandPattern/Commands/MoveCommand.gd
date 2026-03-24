class_name MoveCommand extends Command

var _actor: Node2D
var _from: Vector2i
var _to: Vector2i

func _init(actor:Node2D, from:Vector2i, to:Vector2i) -> void:
	_actor = actor
	_from = from
	_to = to


func execute() -> void:
	_actor.move_to(_to)


func unexecute() -> void:
	_actor.move_to(_from)

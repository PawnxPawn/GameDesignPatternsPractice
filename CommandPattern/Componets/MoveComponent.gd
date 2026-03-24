class_name MoveComponent extends Component

var grid_position: Vector2i
var tile_size: int = 16

func on_bind() -> void:
	grid_position = Vector2i(_actor.position / tile_size)


func move_to(target: Vector2i, world_pos: Vector2i) -> void:
	grid_position = target
	_actor.position = world_pos

# grid_manager.gd
class_name GridService extends Node

var _tile_map: TileMapLayer

func register_tile_layer(tile_map: TileMapLayer) -> void:
	_tile_map = tile_map

func unregister_tile_layer() -> void:
	_tile_map = null


func is_walkable(coords: Vector2i) -> bool:
	if not _tile_map: return false
	var tile_data: TileData = _tile_map.get_cell_tile_data(coords)
	if not tile_data: return false
	return tile_data.get_custom_data("is_walkable")


func is_occupied(_coords: Vector2i) -> bool:
	return false


func world_to_grid(world_pos: Vector2) -> Vector2i:
	if not _tile_map: 
		push_warning("GridService: Tile layer not found: func world_to_grid")
		return Vector2.ZERO
	return _tile_map.local_to_map(world_pos)


func grid_to_world(coords: Vector2i) -> Vector2:
	if not _tile_map: return Vector2.ZERO
	return _tile_map.map_to_local(coords)

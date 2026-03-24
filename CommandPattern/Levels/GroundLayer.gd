extends TileMapLayer

func _ready() -> void:
	ServiceLocator.instance.grid_service.register_tile_layer(self)


func _exit_tree() -> void:
	ServiceLocator.instance.grid_service.unregister_tile_layer()

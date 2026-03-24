extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	ServiceLocator.instance.scene_service.load_scene("world")

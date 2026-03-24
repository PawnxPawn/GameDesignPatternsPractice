class_name SceneManager extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	ServiceLocator.instance.scene_service.register_scene_manager(self)


func _exit_tree() -> void:
	ServiceLocator.instance.scene_service.unregister_scene_manager()

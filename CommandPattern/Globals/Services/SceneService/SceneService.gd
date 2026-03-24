class_name SceneService extends Node

var _scene_manager: SceneManager
var _scenes: Dictionary[StringName, StringName] = {
	"main_menu": "",
	"world": "uid://cknaim5sog1mm",
}
var _current_scene: Node = null

func register_scene_manager(scene_manager: SceneManager) -> void:
	_scene_manager = scene_manager

func unregister_scene_manager() -> void:
	_scene_manager = null

func load_scene(scene_name:StringName) -> void:
	if not _scene_manager:
		push_error("SceneService: No SceneManager registered")
		return
	if not _scenes.has(scene_name):
		push_error("SceneService: Scene not found: " + scene_name)
		return
	_unload_current()
	_load(scene_name)


func  _unload_current() -> void:
	if not _current_scene: return
	_current_scene.queue_free()


func _load(scene_name: StringName) -> void:
	var scene: Node = load(_scenes[scene_name]).instantiate()
	_scene_manager.add_child(scene)
	_current_scene = scene

class_name ServiceLocator extends Node

static var instance: ServiceLocator

var grid_service: GridService
var scene_service: SceneService
var event_bus: EventBus


func _ready() -> void:
	if not instance:
		instance = self
		_init_services()
	else:
		queue_free()


func _init_services() -> void:
	grid_service = _load("uid://wbusxyjk26tv")
	scene_service = _load("uid://jp7r65hhlysi")
	event_bus = _load("uid://cnvkkeel41sc1")


func _load(path: String) -> Node:
	var node: Node = load(path).instantiate()
	add_child(node)
	return node

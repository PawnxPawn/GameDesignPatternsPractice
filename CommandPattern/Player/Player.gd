extends Node2D

@export var _components: Array[Component]

var _command_history: CommandHistory
var _move: MoveComponent
var _grid_service: GridService

func _ready() -> void:
	_grid_service = ServiceLocator.instance.grid_service
	_command_history = CommandHistory.new()
	_bind_components()
	_assign_componets()
	_connect_signals()
	_move.grid_position = _grid_service.world_to_grid(position)
	position = _grid_service.grid_to_world(_move.grid_position)


func _bind_components() -> void:
	for component:Component in _components:
		component.bind(self)


func _assign_componets() -> void:
	_move = get_component(MoveComponent) as MoveComponent


func _connect_signals() -> void:
	var input:InputComponent = get_component(InputComponent) as InputComponent
	
	if input:
		input.move_requested.connect(_on_move_requested)
		input.undo_requested.connect(_on_undo_requested)
		input.redo_requested.connect(_on_redo_requested)


func _process(delta: float) -> void:
	_update_components(delta)


func _physics_process(delta: float) -> void:
	_physics_update_components(delta)


func _update_components(delta: float) -> void:
	for component:Component in _components:
		component.update(delta)


func _physics_update_components(delta: float) -> void:
	for component:Component in _components:
		component.physics_update(delta)


func get_component(type:GDScript) -> Component:
	for component:Component in _components:
		if component.get_script() == type:
			return component
	return null


func move_to(target: Vector2i) -> void:
	if not _move: return
	var world_pos: Vector2 = _grid_service.grid_to_world(target)
	_move.move_to(target, world_pos)


func _on_move_requested(direction: Vector2i) -> void:
	if not _move: return
	if not _grid_service.is_walkable(_move.grid_position + direction): return
	var from: Vector2i = _move.grid_position
	var to: Vector2i = _move.grid_position + direction
	_command_history.execute_command(MoveCommand.new(self, from, to))


func _on_undo_requested() -> void:
	_command_history.undo()


func _on_redo_requested() -> void:
	_command_history.redo()

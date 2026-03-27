extends CanvasLayer

var _scene_names: Array[StringName] = []
var _current_index: int = 0

@onready var _label: Label = %Label
@onready var _left_button: Button = %LeftButton
@onready var _right_button: Button = %RightButton
@onready var _play_button: Button = %PlayButton


func _ready() -> void:
	_scene_names = ServiceLocator.instance.scene_service.get_scene_names()
	_left_button.pressed.connect(_on_left)
	_right_button.pressed.connect(_on_right)
	_play_button.pressed.connect(_on_play)
	_update_label()


func _on_left() -> void:
	_current_index = wrapi(_current_index - 1, 0, _scene_names.size())
	_update_label()


func _on_right() -> void:
	_current_index = wrapi(_current_index + 1, 0, _scene_names.size())
	_update_label()


func _on_play() -> void:
	ServiceLocator.instance.scene_service.load_scene(_scene_names[_current_index])
	hide()


func _update_label() -> void:
	_label.text = str(_scene_names[_current_index])

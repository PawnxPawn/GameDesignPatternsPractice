class_name AnimationComponent extends Component

signal animation_finished(anim_name: StringName)

var _sprite: AnimatedSprite2D
var _facing: Vector2i = Vector2i(0, 1)
var facing: Vector2i:
	get:
		return _facing


func on_bind() -> void:
	_sprite = _actor.get_node("AnimatedSprite2D") as AnimatedSprite2D
	_sprite.animation_finished.connect(_on_animation_finished)


func play_idle() -> void:
	_sprite.stop()
	_sprite.animation = &"Idle"
	_sprite.frame = _direction_to_idle_frame(_facing)


func play_walk(direction: Vector2i) -> void:
	_facing = direction
	_sprite.play(_direction_to_walk_anim(direction))


func play_walk_reverse(direction: Vector2i) -> void:
	_sprite.play_backwards(_direction_to_walk_anim(direction))


func _on_animation_finished() -> void:
	animation_finished.emit(_sprite.animation)


func _direction_to_idle_frame(direction: Vector2i) -> int:
	match direction:
		Vector2i(0, 1):  return 0
		Vector2i(-1, 0): return 1
		Vector2i(0, -1): return 2
		Vector2i(1, 0):  return 3
	return 0


func _direction_to_walk_anim(direction: Vector2i) -> StringName:
	match direction:
		Vector2i(0, 1):  return &"WalkDown"
		Vector2i(-1, 0): return &"WalkLeft"
		Vector2i(0, -1): return &"WalkUp"
		Vector2i(1, 0):  return &"WalkRight"
	return &"WalkDown"


func set_facing(direction: Vector2i) -> void:
	_facing = direction

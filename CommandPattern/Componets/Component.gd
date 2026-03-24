class_name Component extends Resource


var _actor: Node2D

func bind(actor:Node2D) -> void:
	_actor = actor
	on_bind()


func on_bind() -> void:
	pass


func update(_delta:float) -> void:
	pass


func physics_update(_delta: float) -> void:
	pass

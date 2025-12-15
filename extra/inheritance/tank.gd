extends Unit

@export var projectile: PackedScene

func _process(delta: float) -> void:
	move()
	attack()

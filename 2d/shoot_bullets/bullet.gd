extends Area2D

@export var speed: float = 400

func _ready() -> void:
	await get_tree().create_timer(5.0).timeout
	queue_free()

func _physics_process(delta: float) -> void:
	position += transform.x * speed * delta

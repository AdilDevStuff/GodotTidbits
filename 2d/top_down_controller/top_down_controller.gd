extends CharacterBody2D

@export var speed: float = 400.0

func _physics_process(_delta: float) -> void:
	var input_vector = Input.get_vector("left", "right", "up", "down")
	if input_vector:
		velocity = input_vector * speed
	else:
		velocity = Vector2.ZERO
	move_and_slide()

extends CharacterBody2D

@export var speed: float = 400
@export var jump_force: float = 300

@export var gravity: float = 980

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += gravity * delta
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = -jump_force
	
	var direction = Input.get_axis("left", "right")
	velocity = Vector2(direction * speed, velocity.y)
	move_and_slide()

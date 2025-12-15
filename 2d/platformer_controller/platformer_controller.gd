extends CharacterBody2D

@export var speed: float = 400
@export var jump_force: float = 300

@export var gravity: float = 980

var is_in_range: bool = false
var target: CharacterBody2D

var held_object: CharacterBody2D

@onready var hand_position: Marker2D = $HandPosition

func _physics_process(delta: float) -> void:
	pickup_object()
	drop_object()
	
	if not is_on_floor():
		velocity.y += gravity * delta
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = -jump_force
	
	var direction = Input.get_axis("left", "right")
	velocity = Vector2(direction * speed, velocity.y)
	move_and_slide()

func pickup_object() -> void:
	if is_in_range:
		if Input.is_action_just_pressed("pickup") and !held_object:
			held_object = target
			held_object.reparent(hand_position)
			held_object.position = hand_position.position

func drop_object() -> void:
	if Input.is_action_just_pressed("drop") and held_object:
		held_object.reparent(get_parent())
		held_object.position = position + Vector2.RIGHT * 150
		held_object = null

func _on_range_body_entered(body: Node2D) -> void:
	if body is Pickable:
		is_in_range = true
		target = body

func _on_range_body_exited(body: Node2D) -> void:
	if body is Pickable:
		is_in_range = false
		target = null

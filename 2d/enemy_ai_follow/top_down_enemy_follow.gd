extends CharacterBody2D

@export var move_speed: float = 150.0

@onready var player: CharacterBody2D = get_tree().get_first_node_in_group("Player")

func _physics_process(delta: float) -> void:
	if position > player.global_position:
		$Sprite2D.flip_h = true
	else:
		$Sprite2D.flip_h = false
	
	var direction = position.direction_to(player.global_position).normalized()
	velocity = direction * move_speed
	move_and_slide()

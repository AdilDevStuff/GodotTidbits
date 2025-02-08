extends CharacterBody2D

@export var firerate: float = 0.2

@export var bullet_scene: PackedScene

var can_shoot: bool = true

func _process(delta: float) -> void:
	look_at(get_global_mouse_position())

	if Input.is_action_pressed("shoot") and can_shoot:
		can_shoot = false
		spawn_bullet()
		await get_tree().create_timer(firerate).timeout
		can_shoot = true

func spawn_bullet() -> void:
	var bullet_instance = bullet_scene.instantiate()
	bullet_instance.global_transform = global_transform
	get_parent().add_child(bullet_instance)

extends CharacterBody2D

@onready var sprite: Sprite2D = $Sprite2D

func _physics_process(delta: float) -> void:
	look_at(get_global_mouse_position())
	
	# Flip Player Sprite Based on Mouse Position (Optional)
	if position > get_global_mouse_position():
		sprite.flip_v = true
	else:
		sprite.flip_v = false

extends VBoxContainer

# <---------------------------------------------------------------------------------> #
# Originally, the tutorial used tween, but you can also use lerp if you want to       #
# <-- If you want to use tween to animate, replace Line 12 with                       # 
## start_tween(button, "scale", scale + Vector2.ONE * tween_intensity, tween_duration)#
#                                                                                     #
# And Line 14 with this                                                               #
## start_tween(button, "scale", Vector2.ONE, tween_duration)                          #
# <---------------------------------------------------------------------------------> #

@export var intensity: float = 0.1
@export var duration: float = 0.2

func _process(delta: float) -> void:
	# Get all the children of this vboxcontainer (which are all button)
	for button: Button in get_children():
		button.pivot_offset = button.size / 2
		if button.is_hovered():
			button.scale = button.scale.lerp(scale + Vector2.ONE * intensity, duration)
		else:
			button.scale = button.scale.lerp(Vector2.ONE, duration)

func start_tween(object: Object, property: NodePath, final_val: Variant, duration: float) -> void:
	var tween = create_tween()
	tween.tween_property(object, property, final_val, duration)
	await tween.finished
	tween.kill()

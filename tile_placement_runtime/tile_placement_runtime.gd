extends TileMapLayer

func _process(delta: float) -> void:
	var mouse_pos = get_global_mouse_position()
	var local_map_pos = local_to_map(mouse_pos)
	
	if Input.is_action_pressed("build"):
		#set_cell(local_map_pos, 0, Vector2i(1,1))
		set_cells_terrain_connect([local_map_pos], 0, 0, false)
	elif Input.is_action_pressed("destroy"):
		set_cells_terrain_connect([local_map_pos], 0, -1, false)
		#erase_cell(local_map_pos)

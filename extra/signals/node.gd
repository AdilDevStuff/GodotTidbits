extends Node


func _on_item_purchased(is_purchased: bool = false) -> void:
	print("Is purchased: " + str(is_purchased))

extends Node2D

signal on_item_purchased(is_purchased: bool)

@onready var button: Button = $Button
@export var item_value: int
@export var item_name: String

func _ready() -> void:
	button.pressed.connect(on_btn_pressed.bind(item_value, item_name))

func on_btn_pressed(value: int, _item_name: String) -> void:
	print("%d %s" % [value, _item_name])
	on_item_purchased.emit(true)

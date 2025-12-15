extends Node2D

func _ready() -> void:
	Global.SumCalculated.connect(_on_sum_calculated)
	Global.sum(10, 20)

func _on_sum_calculated(total: int) -> void:
	print(total)

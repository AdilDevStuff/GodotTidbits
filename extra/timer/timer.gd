extends Node2D

@onready var timer: Timer = $Timer

func _ready() -> void:
	timer.start(2.0)

func _on_timer_timeout() -> void:
	print("Timer Ended!")

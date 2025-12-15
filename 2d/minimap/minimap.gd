extends CanvasLayer

@onready var sub_viewport: SubViewport = $PanelContainer/MarginContainer/SubViewportContainer/SubViewport
@onready var minimap_camera: Camera2D = $PanelContainer/MarginContainer/SubViewportContainer/SubViewport/MinimapCamera
@onready var player: CharacterBody2D = $"../Player"

func _ready() -> void:
	minimap_camera.zoom = Vector2.ONE * 0.2
	sub_viewport.world_2d = get_tree().root.world_2d

func _process(delta: float) -> void:
	minimap_camera.position = player.global_position

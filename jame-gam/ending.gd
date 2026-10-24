extends Area2D

@onready var canvas_layer: CanvasLayer = $"/root/level_ending/CanvasLayer3"



func _on_body_entered(_body: Node2D) -> void:
	canvas_layer.visible = true

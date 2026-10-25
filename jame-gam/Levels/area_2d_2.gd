extends Area2D


@onready var can: Sprite2D = $Can


func _on_body_entered(body: Node2D) -> void:
	if body.name == "CharacterBody2D":
		can.visible = false
		


func _on_body_exited(body: Node2D) -> void:
	if body.name == "CharacterBody2D":
		can.visible = true

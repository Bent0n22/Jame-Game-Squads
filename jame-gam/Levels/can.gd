extends Area2D

@onready var front: Sprite2D = $Front



func _on_body_entered(body: Node2D) -> void:
	if body.name == "CharacterBody2D":
		front.visible = false

func _on_body_exited(body: Node2D) -> void:
	if body.name == "CharacterBody2D":
		front.visible = true

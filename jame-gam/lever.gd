extends Node2D

@onready var sprite = $Area2D/Sprite2D

var player_in_range = false
var texture_a = preload("res://Assets/Sprites/SwitchA.png")
var texture_b = preload("res://Assets/Sprites/SwitchB.png")
var leverState = false

func _ready() -> void:
	sprite.texture = texture_a

func _on_area_2d_body_entered(body: Node2D) -> void:
	print(body.name)
	if body.name == "CharacterBody2D":
		player_in_range = true
		print("Enter")

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.name == "CharacterBody2D":
		player_in_range = false
		print("Exit")

func _process(delta: float) -> void:
	if player_in_range:
		if leverState == false:
			if Input.is_action_just_pressed("Interact"):
				GameController.switchLever()
				leverState = true
				sprite.texture = texture_b
		else:
			if Input.is_action_just_pressed("Interact"):
				GameController.switchLever()
				leverState = false
				sprite.texture = texture_a

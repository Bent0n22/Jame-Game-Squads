extends Node2D

@export var file_to: String
@export var pos_to: Vector2

var player_in_range = false

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
		if Input.is_action_just_pressed("Interact"):
			GameController.tempVars.temp_pos = pos_to
			SceneLoaderScene.transition_to_scene(file_to)

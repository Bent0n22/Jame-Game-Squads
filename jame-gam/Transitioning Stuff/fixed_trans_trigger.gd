extends Node2D

@export var file_to: String
@export var pos_to: Vector2

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "CharacterBody2D":
		GameController.tempVars.temp_pos = pos_to
		SceneLoaderScene.transition_to_scene(file_to)

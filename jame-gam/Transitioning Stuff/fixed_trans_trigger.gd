extends Node2D

@export var file_to: String
@export var pos_to: Vector2
@onready var estrana: Node2D = $"../Granma Death/Estrana"



func _on_area_2d_body_entered(body: Node2D) -> void:
	if estrana != null:
		if body.name == "CharacterBody2D" && estrana.killed_granma == true:
			GameController.tempVars.temp_pos = pos_to
			SceneLoaderScene.transition_to_scene(file_to)
	else:
		GameController.tempVars.temp_pos = pos_to
		SceneLoaderScene.transition_to_scene(file_to)

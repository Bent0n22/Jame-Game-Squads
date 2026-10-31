extends Node2D

@export var file_to: String
@export var pos_to: Vector2
@onready var timer: Timer = $Timer

func _ready() -> void:
	timer.start(5)

func _on_timer_timeout() -> void:
		GameController.time_into_music = 0
		GameController.tempVars.temp_pos = pos_to
		SceneLoaderScene.transition_to_scene("res://Levels/level_backyard.tscn")

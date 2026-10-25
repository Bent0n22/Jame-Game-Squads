extends Area2D

@onready var timer: Timer = $Timer
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D

func _on_body_entered(body: Node2D) -> void:
	if body.name == "CharacterBody2D":
		timer.start()
		audio_stream_player_2d.play()

func _on_timer_timeout() -> void:
	GameController.leverStatus = false
	get_tree().reload_current_scene()

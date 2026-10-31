extends Area2D

@onready var timer: Timer = $Timer
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D
var stopCamX = false
var pbody

func _on_body_entered(body: Node2D) -> void:
	if body.name == "CharacterBody2D":
		stopCamX = true
		pbody = body
		timer.start()
		audio_stream_player_2d.play()

func _process(delta: float) -> void:
	if stopCamX:
		pbody.get_node("Camera2D").offset.x += -pbody.velocity.x * delta
	pass

func _on_timer_timeout() -> void:
	GameController.leverStatus = false
	get_tree().reload_current_scene()

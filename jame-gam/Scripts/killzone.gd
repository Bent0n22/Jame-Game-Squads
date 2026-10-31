extends Area2D

@onready var timer: Timer = $Timer
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D
var stopCamX = false
var pbody

var ragdoll_of_fun_and_whimsy = preload("res://ragdoll.tscn")
var boring_not_ragdoll = preload("res://player.tscn")
func _on_body_entered(body: Node2D) -> void:
	if body.name == "CharacterBody2D":
		stopCamX = true
		pbody = body
		timer.start(5)
		audio_stream_player_2d.play()
		var little_guy_ragdoll = ragdoll_of_fun_and_whimsy.instantiate()
		little_guy_ragdoll.global_position = body.global_position
		little_guy_ragdoll.get_node("RigidBody2D").linear_velocity = body.velocity
		little_guy_ragdoll.get_node("RigidBody2D").add_constant_torque(500)
		get_tree().root.add_child(little_guy_ragdoll)
		get_tree().get_current_scene().get_node("Player").queue_free()

func _process(_delta: float) -> void:
	if stopCamX:
		#pbody.get_node("Camera2D").offset.x += -pbody.velocity.x * delta
		pass
	pass

func _on_timer_timeout() -> void:
	GameController.leverStatus = false
	get_tree().reload_current_scene()

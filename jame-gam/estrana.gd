extends Node2D

var player_in_range = false

@export var linesagain: Array[String]

#const lines: Array[String] = [
#	"hey there...",
#	"im your gramma estrana.",
#	"ok goodbye"
#]

@onready var sfx = preload("res://text_box/speech_sfx.wav")

func _on_area_2d_body_entered(body: Node2D) -> void:
	print(body.name + "ENTERED")
	
	if body.name == "CharacterBody2D":
		player_in_range = true
		print("Enter")

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.name == "CharacterBody2D":
		player_in_range = false
	print(body.name)

var can_talk = true

func _on_dialog_finished():
	can_talk = false
	# Wait one frame (or a tiny fraction of a second) so the current press is ignored
	await get_tree().process_frame 
	can_talk = true

func _unhandled_input(event):
	if event.is_action_pressed("Interact") and player_in_range and can_talk:
		DialogManager.start_dialog(global_position, linesagain, sfx)

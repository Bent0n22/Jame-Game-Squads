extends Area2D

const lines: Array[String] = [
	"Sweetie",
	"You fell, dont hurt yourself",
	"Now get back up and try again!"
	
]
@onready var sfx = preload("res://text_box/speech_sfx.wav")

func _on_body_entered(body: Node2D) -> void:
	if body.name == "CharacterBody2D":
		DialogManager.start_dialog(Vector2(424, 25), lines, sfx)
#replace her boring tutorial text with something similar

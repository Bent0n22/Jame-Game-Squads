extends Area2D

const lines: Array[String] = [
	"Dumbass",
	"You failed at the only obstacle in the entire area",
	"And here I thought I was the one who was going to fall down the stairs first",
	"I mean I already have a broken hip and I would've made that jump"
]
@onready var sfx = preload("res://text_box/speech_sfx.wav")

func _on_body_entered(body: Node2D) -> void:
	DialogManager.start_dialog(Vector2(400, 10), lines, sfx)
#replace her boring tutorial text with something similar

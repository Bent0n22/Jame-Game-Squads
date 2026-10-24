extends Node2D


@onready var anim = $AnimationPlayer
@onready var rect = $CanvasLayer/ColorRect
const time_waited = 1.75

func _ready() -> void:
	rect.color = Color(00, 00, 00, 00)
	pass

func transition_to_scene(scene) -> void:
	anim.play("FadeToBlack")
	await GameController.wait(time_waited)
	get_tree().change_scene_to_file(scene)
	anim.play_backwards("FadeToBlack")
	pass

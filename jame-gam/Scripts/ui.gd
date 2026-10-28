extends Control
@onready var label = $CanvasLayer/Label

func _on_texture_button_pressed() -> void:
	SceneLoaderScene.transition_to_scene("res://menu.tscn")

func _process(_delta: float) -> void:
	label.text = str(GameController.time)
	label.visible = GameController.game_start

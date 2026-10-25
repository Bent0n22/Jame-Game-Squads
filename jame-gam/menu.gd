extends Control


func _on_play_game_pressed() -> void:
	SceneLoaderScene.transition_to_scene("res://Levels/level_tutorial.tscn")


func _on_exit_game_pressed() -> void:
	get_tree().quit()
	pass # Replace with function body.

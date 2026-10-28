extends Node2D

func _ready() -> void:
	GameController.tempVars.room = "res://Levels/level_backyard.tscn"

func _process(delta: float) -> void:
	if GameController.key_count == 0:
		$Key3.visible = false
		$ThisIsActuallyKeyHoleFrCubedButButNotReallyIdkManNamingFilesIsKindaDifficultLikeItIsBetterButNahNotReally.visible = true
	elif GameController.key_count == 2:
		$Key3.visible = false
		$ThisIsActuallyKeyHoleFrCubedButButNotReallyIdkManNamingFilesIsKindaDifficultLikeItIsBetterButNahNotReally.visible = false
	elif GameController.key_count == 1:
		$Key3.visible = true

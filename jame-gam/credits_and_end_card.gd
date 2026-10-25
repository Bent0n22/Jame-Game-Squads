extends Node2D

@onready var anim = $AnimationPlayer

func _ready() -> void:
	await GameController.wait(1.5)
	anim.play("Play End Scene")
	

func _process(delta: float) -> void:
	
	pass

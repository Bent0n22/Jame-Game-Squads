extends Node2D

@export var baseDecision: bool

func _physics_process(_delta: float) -> void:
	if baseDecision == false:
		$StaticBody2D/CollisionShape2D.disabled = !GameController.leverStatus
	else:
		$StaticBody2D/CollisionShape2D.disabled = GameController.leverStatus

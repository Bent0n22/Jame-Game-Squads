extends AnimatableBody2D

@export var PositionStart: Vector2
@export var PositionEnd: Vector2
@export var Speed: Vector2

var distance = PositionEnd - PositionStart
var direction = 1

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	print(position.x)
	position.x += 1
	match direction:
		1: 
			position.x += (distance.x/abs(distance.x)) * Speed.x
			position.y += (distance.y/abs(distance.y)) * Speed.y
		-1:
			position -= (-distance/abs(distance)) * Speed

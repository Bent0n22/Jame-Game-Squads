extends Node2D

@export var loop: bool
@export var time_to_complete_path: float
@export var time_break_between_paths: float
@export var rotates: bool
@export var trigger_group_id: int
@export var one_shot: bool

@onready var anim = $AnimationPlayer
@onready var path_follower = $Path/Follow

var can_trigger = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	path_follower.rotates = rotates
	if trigger_group_id == 0:
		await GameController.wait(time_break_between_paths)
		move_block(true)

func OnTrigger(key):
	if key == trigger_group_id and can_trigger:
		move_block(true)


func move_block(is_forwards):
	
	if is_forwards:
		$AnimatableBody2D/AnimatedSprite2D.scale = Vector2(1,1)
		anim.play("move_along_path", -1, 1/time_to_complete_path, false)
		can_trigger = false
		await anim.animation_finished
		await GameController.wait(time_break_between_paths)
		can_trigger = true
		if !one_shot:
			if loop:
				move_block(true)
			else:
				move_block(false)
	else:
		$AnimatableBody2D/AnimatedSprite2D.scale = Vector2(-1,1)
		anim.play("move_along_path", -1, -1/time_to_complete_path, true)
		can_trigger = false
		await anim.animation_finished
		await GameController.wait(time_break_between_paths)
		can_trigger = true
		if !one_shot:
			move_block(true)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	$AnimatableBody2D.position = path_follower.position
	print($AnimatableBody2D.position)
	pass

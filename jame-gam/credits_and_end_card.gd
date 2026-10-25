extends Node2D

@onready var anim = $AnimationPlayer
var swfi = false
var swfiii = false
@onready var Z = $CanvasLayer/Z

func _ready() -> void:
	Z.visible = false
	await GameController.wait(1.5)
	anim.play("Play End Scene")
	await anim.animation_finished
	Z.visible = true
	swfi = true

func wait_for_interact():
	if Input.is_action_just_pressed("Interact"):
		anim.play("Play End Scene to Stargazing")
		Z.visible = false
		await anim.animation_finished
		Z.visible = true
		swfi = false
		swfiii = true

var swfv = false

func wait_for_end():
	if Input.is_action_just_pressed("Interact"):
		anim.play("Credits")
		Z.visible = false
		await anim.animation_finished
		swfiii = false
		swfv = true

func wait_for_cred():
	if Input.is_action_just_pressed("Interact"):
		SceneLoaderScene.transition_to_scene("res://menu.tscn")
		Z.visible = false

func _process(delta: float) -> void:
	if swfi:
		wait_for_interact()
	if swfiii:
		wait_for_end()
	if swfv:
		wait_for_cred()
	pass

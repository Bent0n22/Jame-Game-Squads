extends Node2D

@onready var anim = $AnimationPlayer
var swfi = false
var swfiii = false
@onready var Z = $CanvasLayer/Z

func _ready() -> void:
	GameController.tempVars.room = "res://Levels/level_tutorial.tscn"
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


func wait_for_end():
	if Input.is_action_just_pressed("Interact"):
		anim.play("Credits")
		Z.visible = false
		await anim.animation_finished
		swfiii = false


func _process(delta: float) -> void:
	if swfi:
		wait_for_interact()
	if swfiii:
		wait_for_end()
	pass


func _on_button_pressed() -> void:
	SceneLoaderScene.transition_to_scene("res://menu.tscn")
	pass # Replace with function body.

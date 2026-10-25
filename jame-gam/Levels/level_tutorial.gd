extends Node2D

var grate1 = preload("res://Assets/Sprites/Sewer Grates/SewerGrate1.png")
var grate2 = preload("res://Assets/Sprites/Sewer Grates/SewerGrate2.png")
var grate3 = preload("res://Assets/Sprites/Sewer Grates/SewerGrate3.png")
var grate4 = preload("res://Assets/Sprites/Sewer Grates/SewerGrate4.png")
var grate5 = preload("res://Assets/Sprites/Sewer Grates/SewerGrate5.png")
var grate6 = preload("res://Assets/Sprites/Sewer Grates/SewerGrate6.png")

func _process(delta: float) -> void:
	if GameController.leverStatus:
		$Standing.visible = true
	if !GameController.leverStatus:
		$Standing.visible = false
	
	for child in $Grate.get_children():
		if GameController.leverStatus == false:
			match child.texture:
				grate1:
					child.texture = grate2
				grate3:
					child.texture = grate4
				grate5:
					child.texture = grate6
		if GameController.leverStatus:
			match child.texture:
				grate2:
					child.texture = grate1
				grate4:
					child.texture = grate3
				grate6:
					child.texture = grate5

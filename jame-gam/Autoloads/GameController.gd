extends Node

var talking = false
var leverStatus = false
var key_count = 0
var game_won = false

func switchLever():
	if leverStatus:
		leverStatus = false
	else:
		leverStatus = true

func wait(time_in_seconds) -> void:
	await get_tree().create_timer(time_in_seconds).timeout

var persistant = {
	
}
var tempVars = {
	room = "res://Levels/level_tutorial.tscn"
}

func save():
	return persistant

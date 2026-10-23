extends Node

func wait(time_in_seconds) -> void:
	await get_tree().create_timer(time_in_seconds).timeout

var persistant = {
	
}
var tempVars = {
	
}

func save():
	return persistant

extends Node

var save_path = "user://savedata.save"

func new_game(selected_path) -> void:
	var save_file = FileAccess.open(selected_path, FileAccess.WRITE)
	var player_vars = GameController.call("save")
	var player_vars_json_string = JSON.stringify(player_vars)
	save_file.store_line(player_vars_json_string)

func save_game() -> void:
	var save_file = FileAccess.open(save_path, FileAccess.WRITE)
	var player_vars = GameController.call("save")
	var player_vars_json_string = JSON.stringify(player_vars)
	save_file.store_line(player_vars_json_string)

func load_game() -> void:
	
	var save_file = FileAccess.open(save_path, FileAccess.READ)
	if save_file == null:
		save_game()
		save_file = FileAccess.open(save_path, FileAccess.READ)
	while save_file.get_position() < save_file.get_length():
		
		var json_string = save_file.get_line()
		print(json_string)
		# Creates the helper class to interact with JSON.
		var json = JSON.new()

		# Check if there is any error while parsing the JSON string, skip in case of failure.
		var parse_result = json.parse(json_string)
		if not parse_result == OK:
			print("JSON Parse Error: ", json.get_error_message(), " in ", json_string, " at line ", json.get_error_line())
			continue
		
		# Get the data from the JSON object.
		var node_data = json.data
		
		for i in node_data.keys():
			GameController.persistant.set(i, node_data[i])

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

extends Node

var config_file = ConfigFile.new()
var config_error
var _highest_level_progress: int = 0 setget set_highest_level_progress, get_highest_level_progress
var _level_deaths_dict = {}


func _ready():
	load_config_file()


func set_highest_level_progress(new_value: int):
	if new_value > _highest_level_progress:
		_highest_level_progress = new_value
		save_config_file()


func get_highest_level_progress() -> int:
	return _highest_level_progress


func get_level_deaths(level_val: int) -> int:
	var death_amount = _level_deaths_dict.get(level_val, 0)
	return death_amount


func set_level_deaths(level_val, new_death_amount):
	_level_deaths_dict[level_val] = new_death_amount


func load_game():
	var save_game = File.new()
	var save_file = "user://savegame.save"
	if not save_game.file_exists(save_file):
		return # Error! We don't have a save to load.
	
	save_game.open(save_file, File.READ)
	while save_game.get_position() < save_game.get_len():
		# Get the saved dictionary from the next line in the save file
		var save_data = parse_json(save_game.get_line())
		
		# TODO parse the json data into the dictionary
		pass

	save_game.close()


func save_game():
	var save_game = File.new()
	save_game().open("user://savegame.save", File.WRITE)
	save_game().store_line(to_json(_level_deaths_dict))
	save_game().close()


func save_config_file():
	config_file.set_value("game_progress", "highest_level", get_highest_level_progress())
	config_error = config_file.save("user://settings.cfg")
	if config_error != OK: 
		print("Config file saving error: " + str(config_error))


func load_config_file():
	config_error = config_file.load("user://settings.cfg")
	if config_error == OK:
		var temp_highest_level = config_file.get_value("game_progress", "highest_level", get_highest_level_progress())
		set_highest_level_progress(temp_highest_level)
	else: 
		print("Config file loading error: " + str(config_error))

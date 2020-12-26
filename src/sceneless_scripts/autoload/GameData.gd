extends Node


var _highest_level_progress: int = 0 setget set_highest_level_progress, get_highest_level_progress
var _level_deaths_dict = {}


func set_highest_level_progress(new_value: int):
	_highest_level_progress = new_value


func get_highest_level_progress() -> int:
	if (_highest_level_progress - 5) <= 0:
		return 0
	else:
		return _highest_level_progress - 5


func get_level_deaths(level_val: int) -> int:
	var death_amount = _level_deaths_dict.get(level_val, 0)
	return death_amount


func set_level_deaths(level_val, new_death_amount):
	_level_deaths_dict[level_val] = new_death_amount


func load_data():
	pass


func save_data():
	pass

extends VBoxContainer


export var _level_number: int setget set_level_number, get_level_number
var _amount_of_deaths: int setget set_amount_of_deaths
var _level_path: String setget set_level_path


func set_level_number(new_value: int):
	_level_number = new_value
	$LevelContainer/LevelNum.text = str(_level_number)


func get_level_number() -> int:
	return _level_number


func set_amount_of_deaths(new_value: int): 
	_amount_of_deaths = new_value
	$DeathsContainer/DeathCount.text = str(_amount_of_deaths)


func set_level_path(new_value: String):
	_level_path = new_value


func _on_PlayButton_button_up():
	get_tree().change_scene(_level_path)

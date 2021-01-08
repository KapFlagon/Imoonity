extends VBoxContainer


export var _level_number: int setget set_level_number, get_level_number
var _amount_of_deaths: int setget set_amount_of_deaths
var _level_path: String setget set_level_path
var _level_locked: bool setget set_level_locked


func set_level_number(new_value: int):
	_level_number = new_value
	var text_level_number = parse_number_to_text(new_value)
	get_node("LevelContainer/LevelNum").text = text_level_number


func get_level_number() -> int:
	return _level_number


func set_amount_of_deaths(new_value: int): 
	_amount_of_deaths = new_value
	var text_deaths_number = parse_number_to_text(new_value)
	get_node("DeathsContainer/DeathCount").text = text_deaths_number


func set_level_path(new_value: String):
	_level_path = new_value


func set_level_locked(new_value: bool):
	_level_locked = new_value
	update_labels()


func _on_PlayButton_button_up():
	get_tree().change_scene(_level_path)


func update_labels():
	if _level_locked:
		get_node("PlayButton").disabled = true
		get_node("LockStatusLabel").show()
	else: 
		get_node("PlayButton").disabled = false
		get_node("LockStatusLabel").hide()


func parse_number_to_text(new_value: int) -> String:
	var text_num = ""
	if new_value < 10:
		text_num = "0" + str(new_value)
	else: 
		text_num = str(new_value)
	return text_num

extends Node


var puck_equipped: bool = false setget set_puck_equipped, is_puck_equipped
var phobos_equipped: bool = false setget set_phobos_equipped, is_phobos_equipped
var io_equipped: bool = false setget set_io_equipped, is_io_equipped
var titan_equipped: bool = false setget set_titan_equipped, is_titan_equipped


func _ready() -> void:
	set_puck_equipped(true)
	set_phobos_equipped(true)
	set_io_equipped(true)
	set_titan_equipped(true)


func set_puck_equipped(new_value: bool) -> void:
	puck_equipped = new_value


func is_puck_equipped() -> bool: 
	return puck_equipped


func set_phobos_equipped(new_value: bool) -> void:
	phobos_equipped = new_value


func is_phobos_equipped() -> bool: 
	return phobos_equipped


func set_io_equipped(new_value: bool) -> void:
	io_equipped = new_value


func is_io_equipped() -> bool: 
	return io_equipped


func set_titan_equipped(new_value: bool) -> void:
	titan_equipped = new_value


func is_titan_equipped() -> bool: 
	return titan_equipped


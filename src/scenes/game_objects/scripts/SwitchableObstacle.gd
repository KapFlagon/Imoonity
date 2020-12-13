extends Node2D


class_name SwitchableObstacle


export var _obstacle_active: bool = true setget set_obstacle_active, is_obstacle_active


func set_obstacle_active(new_value: bool) -> void:
	_obstacle_active = new_value


func is_obstacle_active() -> bool:
	return _obstacle_active


func flip_active_state() -> void:
	if is_obstacle_active():
		set_obstacle_active(false)
	else: 
		set_obstacle_active(true)

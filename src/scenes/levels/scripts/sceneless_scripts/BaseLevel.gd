extends Node2D


class_name BaseLevel


var player_spawn_coordinates: Vector2 = Vector2.ZERO setget set_player_spawn_coordinates, get_player_spawn_coordinates
var _level_screen_value: int = -1 setget set_level_screen_value, get_level_screen_value
var background
var background2


func _ready() -> void:
	initialize_level()
	background = preload("res://World/BackgroundParent.tscn").instance()
	add_child(background)


func _process(delta):
	background.position = $Player/Camera2D.get_camera_screen_center()


func set_player_spawn_coordinates(new_value: Vector2) -> void:
	player_spawn_coordinates = new_value


func get_player_spawn_coordinates() -> Vector2:
	return player_spawn_coordinates


func set_level_screen_value(new_value: int) -> void:
	_level_screen_value = new_value


func get_level_screen_value() -> int:
	return _level_screen_value


func initialize_level() -> void:
	push_level_data_to_screen_manager()
	pull_player_start_coords_from_level()
	update_player_coords_from_screen_manager()


func pull_player_start_coords_from_level() -> void:
	set_player_spawn_coordinates(get_node("Player").get_position())


func push_level_data_to_screen_manager() -> void:
	if ScreenManager.get_current_screen() == -1:
		ScreenManager.set_current_screen(_level_screen_value)


func update_player_coords_from_screen_manager() -> void:
	var screen_manager_spawn_coordinates = ScreenManager.get_player_start_coordinates()
	if screen_manager_spawn_coordinates == Vector2.ZERO:
		ScreenManager.set_player_start_coordinates(player_spawn_coordinates)
		push_start_coords_to_player()
	else: 
		set_player_spawn_coordinates(screen_manager_spawn_coordinates)
		push_start_coords_to_player()


func push_start_coords_to_player() -> void:
	get_node("Player").set_position(player_spawn_coordinates)


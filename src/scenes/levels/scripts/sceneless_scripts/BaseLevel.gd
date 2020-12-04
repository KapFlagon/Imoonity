extends Node2D


class_name BaseLevel


var player_spawn_coordinates: Vector2 = Vector2.ZERO setget set_player_spawn_coordinates, get_player_spawn_coordinates
var level_screen_value: int = -1 setget set_level_screen_value, get_level_screen_value


func _ready() -> void:
	initialize_level()


func set_player_spawn_coordinates(new_value: Vector2) -> void:
	player_spawn_coordinates = new_value


func get_player_spawn_coordinates() -> Vector2:
	return player_spawn_coordinates


func set_level_screen_value(new_value: int) -> void:
	level_screen_value = new_value


func get_level_screen_value() -> int:
	return level_screen_value


func push_data_to_screen_manager() -> void:
	if ScreenManager.get_current_screen() == -1:
		ScreenManager.set_current_screen(level_screen_value)


func push_player_coords_to_screen_manager() -> void:
	if get_player_spawn_coordinates() != Vector2.ZERO:
		get_node("Player").set_position(player_spawn_coordinates)


func initialize_level() -> void:
	push_data_to_screen_manager()
	set_player_spawn_coordinates(ScreenManager.get_player_start_coordinates())
	push_player_coords_to_screen_manager()

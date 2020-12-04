extends Node2D


var player_spawn_coordinates: Vector2 = Vector2.ZERO setget set_player_spawn_coordinates, get_player_spawn_coordinates


# Called when the node enters the scene tree for the first time.
func _ready():
	push_data_to_screen_manager()
	set_player_spawn_coordinates(ScreenManager.get_player_start_coordinates())
	if get_player_spawn_coordinates() != Vector2.ZERO:
		$Player.set_position(player_spawn_coordinates)
	#MusicManager.tutorialLevelMusic()


func set_player_spawn_coordinates(new_value: Vector2) -> void:
	player_spawn_coordinates = new_value


func get_player_spawn_coordinates() -> Vector2:
	return player_spawn_coordinates


func push_data_to_screen_manager() -> void:
	if ScreenManager.get_current_screen() == -1:
		ScreenManager.set_current_screen(Enums.SCREENS.TEMPLATE)

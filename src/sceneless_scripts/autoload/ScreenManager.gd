extends Node


var current_screen: int = -1 setget set_current_screen, get_current_screen
var current_screen_scene = null
var player_start_coordinates: Vector2 = Vector2.ZERO setget set_player_start_coordinates, get_player_start_coordinates
var level_dict = {}


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var root = get_tree().get_root()
	current_screen_scene = root.get_child(root.get_child_count() - 1)


func get_current_screen() -> int:
	return current_screen


func set_current_screen(new_current_screen: int) -> void:
	if is_valid_passed_screen(new_current_screen):
		current_screen = new_current_screen

func goto_scene(path):
	# This function will usually be called from a signal callback,
	# or some other function in the current scene.
	# Deleting the current scene at this point is
	# a bad idea, because it may still be executing code.
	# This will result in a crash or unexpected behavior.

	# The solution is to defer the load to a later time, when
	# we can be sure that no code from the current scene is running:

	call_deferred("_deferred_goto_scene", path)


func _deferred_goto_scene(path):
	# It is now safe to remove the current scene
	current_screen_scene.free()

	# Load the new scene.
	var s = ResourceLoader.load(path)

	# Instance the new scene.
	current_screen_scene = s.instance()

	# Add it to the active scene, as child of root.
	get_tree().get_root().add_child(current_screen_scene)

	# Optionally, to make it compatible with the SceneTree.change_scene() API.
	get_tree().set_current_scene(current_screen_scene)


func next_screen(target_screen = null) -> void: 
	var next_scene_path: String = ""
	if target_screen != null:
		next_scene_path = select_next_screen(target_screen)
	else:
		next_scene_path = determine_next_screen()
	goto_scene(next_scene_path)


func determine_next_screen() -> String:
	var new_level_path: String = ""
	match current_screen:
		Enums.SCREENS.MAIN_MENU: 
			new_level_path = "res://src/scenes/screens/IntroCutSceneScreen.tscn"
		Enums.SCREENS.INTRO: 
			new_level_path = "res://src/scenes/levels/prototypes/TemplateLevel.tscn"
		Enums.SCREENS.TEMPLATE: 
			new_level_path = "res://src/scenes/levels/prototypes/TemplateLevel.tscn"
	return new_level_path


func select_next_screen(target_screen: int) -> String: 
	var new_level_path: String = ""
	if is_valid_passed_screen(target_screen):
		match target_screen:
			Enums.SCREENS.MAIN_MENU: 
				new_level_path = "res://src/scenes/screens/StartScreen.tscn"
			Enums.SCREENS.INTRO: 
				new_level_path = "res://src/scenes/screens/IntroCutSceneScreen.tscn"
			Enums.SCREENS.CREDITS:
				new_level_path = "res://src/scenes/screens/CreditsScreen.tscn"
			Enums.SCREENS.HOWTOPLAY:
				new_level_path = "res://src/scenes/screens/HowToPlayScreen.tscn"
			Enums.SCREENS.TEMPLATE: 
				new_level_path = "res://src/scenes/levels/prototypes/TemplateLevel.tscn"
	return new_level_path


func is_valid_passed_screen(passed_screen: int) -> bool:
	var is_valid_passed_screen = false
	for screen in Enums.SCREENS:
		if passed_screen == Enums.SCREENS[screen]:
			is_valid_passed_screen = true
			break
	return is_valid_passed_screen


func set_player_start_coordinates(new_value: Vector2) -> void:
	player_start_coordinates = new_value


func get_player_start_coordinates() -> Vector2: 
	return player_start_coordinates


func get_dict():
	return level_dict


func update_dict(latest_dict):
	level_dict.clear()
	level_dict = latest_dict.duplicate()

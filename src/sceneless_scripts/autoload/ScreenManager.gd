extends Node


var current_screen: int = -1 setget set_current_screen, get_current_screen
var current_screen_scene = null
var player_start_coordinates: Vector2 = Vector2.ZERO setget set_player_start_coordinates, get_player_start_coordinates
var level_dict = {}


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_update_current_screen_scene()


func _update_current_screen_scene() -> void:
	var root = get_tree().get_root()
	current_screen_scene = root.get_child(root.get_child_count() - 1)


func get_current_screen() -> int:
	return current_screen


func set_current_screen(new_current_screen: int) -> void:
	if is_valid_passed_screen(new_current_screen):
		current_screen = new_current_screen
		determine_song(new_current_screen)
		_update_current_screen_scene()
		GameData.set_highest_level_progress(new_current_screen)

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
			set_current_screen(Enums.SCREENS.INTRO)
		Enums.SCREENS.INTRO: 
			new_level_path = "res://src/scenes/levels/prototypes/kf/kf_lvl_01.tscn"
			set_current_screen(Enums.SCREENS.KF_LVL_01)
		Enums.SCREENS.KF_LVL_01: 
			new_level_path = "res://src/scenes/levels/prototypes/gsr/gsr_PhobosTutorialLevel.tscn"
			set_current_screen(Enums.SCREENS.GSR_PHOBOS_TUTORIAL_LEVEL)
		Enums.SCREENS.GSR_PHOBOS_TUTORIAL_LEVEL:
			new_level_path = "res://src/scenes/levels/prototypes/yummy/yjb_lvl_io_Tutorial.tscn"
			set_current_screen(Enums.SCREENS.YJB_LVL_IO_TUTORIAL)
		Enums.SCREENS.YJB_LVL_IO_TUTORIAL:
			new_level_path = "res://src/scenes/levels/prototypes/yummy/yjb_lvl_titan_Tutorial.tscn"
			set_current_screen(Enums.SCREENS.YJB_LVL_TITAN_TUTORIAL)
		Enums.SCREENS.YJB_LVL_TITAN_TUTORIAL:
			new_level_path = "res://src/scenes/levels/prototypes/kf/kf_lvl_02_PuckDash.tscn"
			set_current_screen(Enums.SCREENS.KF_LVL_02_PUCK_DASH)
		Enums.SCREENS.KF_LVL_02_PUCK_DASH:
			new_level_path = "res://src/scenes/levels/prototypes/yummy/yjb_lvl_05_random_button.tscn"
			set_current_screen(Enums.SCREENS.YJB_LVL_05_RANDOM_BUTTON)
		Enums.SCREENS.YJB_LVL_05_RANDOM_BUTTON:
			new_level_path = "res://src/scenes/levels/prototypes/gsr/gsr_BridgeFunLevel.tscn"
			set_current_screen(Enums.SCREENS.GSR_BRIDGE_FUN_LEVEL)
		Enums.SCREENS.GSR_BRIDGE_FUN_LEVEL:
			new_level_path = "res://src/scenes/levels/prototypes/gsr/gsr_SpinnySpin.tscn"
			set_current_screen(Enums.SCREENS.GSR_SPINNY_SPIN)
		Enums.SCREENS.GSR_SPINNY_SPIN:
			new_level_path = "res://src/scenes/levels/prototypes/yummy/yjb_lvl_04_backtrack.tscn"
			set_current_screen(Enums.SCREENS.YJB_LVL_04_BACKTRACK)
		Enums.SCREENS.YJB_LVL_04_BACKTRACK:
			new_level_path = "res://src/scenes/levels/prototypes/gsr/gsr_Timer.tscn"
			set_current_screen(Enums.SCREENS.GSR_TIMER)
		Enums.SCREENS.GSR_TIMER:
			new_level_path = "res://src/scenes/levels/prototypes/gsr/gsr_Puzzle.tscn"
			set_current_screen(Enums.SCREENS.GSR_PUZZLE)
		Enums.SCREENS.GSR_PUZZLE:
			new_level_path = "res://src/scenes/levels/prototypes/kf/kf_lvl_ThePit.tscn"
			set_current_screen(Enums.SCREENS.KF_LVL_THE_PIT)
		Enums.SCREENS.KF_LVL_THE_PIT:
			new_level_path = "res://src/scenes/levels/prototypes/yummy/yjb_lvl_03_Falling_IO_focused.tscn"
			set_current_screen(Enums.SCREENS.YJB_LVL_03_FALLING_IO_FOCUSED)
		Enums.SCREENS.YJB_LVL_03_FALLING_IO_FOCUSED:
			new_level_path = "res://src/scenes/levels/prototypes/kf/kf_lvl_03.tscn"
			set_current_screen(Enums.SCREENS.KF_LVL_03)
		Enums.SCREENS.KF_LVL_03:
			new_level_path = "res://src/scenes/levels/prototypes/gsr/gsr_Confusing.tscn"
			set_current_screen(Enums.SCREENS.GSR_CONFUSING)
		Enums.SCREENS.GSR_CONFUSING:
			new_level_path = "res://src/scenes/levels/prototypes/gsr/gsr_Crossroads.tscn"
			set_current_screen(Enums.SCREENS.GSR_CROSSROADS)
		Enums.SCREENS.GSR_CROSSROADS:
			new_level_path = "res://src/scenes/levels/prototypes/yummy/yjb_lvl_01_IO_Focused.tscn"
			set_current_screen(Enums.SCREENS.YJB_LVL_01_IO_FOCUSED)
		Enums.SCREENS.YJB_LVL_01_IO_FOCUSED:
			new_level_path = "res://src/scenes/levels/prototypes/gsr/gsr_ExpertMode.tscn"
			set_current_screen(Enums.SCREENS.GSR_EXPERT_MODE)
		Enums.SCREENS.GSR_EXPERT_MODE:
			new_level_path = "res://src/scenes/levels/prototypes/yummy/yjb_lvl_02_Titan_Focused.tscn"
			set_current_screen(Enums.SCREENS.YJB_LVL_02_TITAN_FOCUSED)
		Enums.SCREENS.YJB_LVL_02_TITAN_FOCUSED:
			new_level_path = "res://src/scenes/levels/prototypes/gsr/gsr_EasyDeadLevel.tscn"
			set_current_screen(Enums.SCREENS.GSR_EASY_DEAD_LEVEL)
		Enums.SCREENS.GSR_EASY_DEAD_LEVEL: 
			new_level_path = "res://src/scenes/screens/EndCutSceneScreen.tscn"
			set_current_screen(Enums.SCREENS.END)
		Enums.SCREENS.END:
			new_level_path = "res://src/scenes/screens/CreditsScreen.tscn"
			set_current_screen(Enums.SCREENS.CREDITS)
	return new_level_path


func select_next_screen(target_screen: int) -> String: 
	var new_level_path: String = ""
	if is_valid_passed_screen(target_screen):
		match target_screen:
			Enums.SCREENS.MAIN_MENU: 
				new_level_path = "res://src/scenes/screens/StartScreen.tscn"
				MusicManager.play_song("res://assets/music/Godot_Slurp_Master1.ogg")
			Enums.SCREENS.LEVELSELECT:
				new_level_path = "res://src/scenes/screens/LevelSelectScreen.tscn"
			Enums.SCREENS.INTRO: 
				new_level_path = "res://src/scenes/screens/IntroCutSceneScreen.tscn"
			Enums.SCREENS.CREDITS:
				new_level_path = "res://src/scenes/screens/CreditsScreen.tscn"
			Enums.SCREENS.HOWTOPLAY:
				new_level_path = "res://src/scenes/screens/HowToPlayScreen.tscn"
#			Enums.SCREENS.TEMPLATE: 
#				new_level_path = "res://src/scenes/levels/prototypes/TemplateLevel.tscn"
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


func determine_song(level_value: int) -> void:
	if level_value < Enums.SCREENS.YJB_LVL_05_RANDOM_BUTTON: 
		MusicManager.play_song("res://assets/music/Godot_Slurp_Master1.ogg")
	elif level_value >= Enums.SCREENS.YJB_LVL_05_RANDOM_BUTTON and level_value < Enums.SCREENS.GSR_CONFUSING:
		MusicManager.play_song("res://assets/music/Godot_QuantisedFunk_Master1.ogg")
	elif level_value >= Enums.SCREENS.GSR_CONFUSING:
		MusicManager.play_song("res://assets/music/Godot_Escape_Master1.ogg")

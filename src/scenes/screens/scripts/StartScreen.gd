extends BaseScreen


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	poll_screen_manager(Enums.SCREENS.MAIN_MENU)
	MusicManager.play_song("res://assets/music/Godot_Slurp_Master1.ogg")
	pass # Replace with function body.


func _on_GithubLinkButton_button_up() -> int:
	return OS.shell_open("https://github.com/KapFlagon/GHGO2020")


func _on_PlayButton_button_up() -> void:
	ScreenManager.next_screen(Enums.SCREENS.INTRO)


func _on_Credits_button_up() -> void:
	ScreenManager.next_screen(Enums.SCREENS.CREDITS)


func _on_HowToPlayButton_button_up() -> void:
	ScreenManager.next_screen(Enums.SCREENS.HOWTOPLAY)


func _on_LevelSelectButton_button_up():
#	ScreenManager.next_screen(Enums.SCREENS.LEVELSELECT)
	pass # Replace with function body.

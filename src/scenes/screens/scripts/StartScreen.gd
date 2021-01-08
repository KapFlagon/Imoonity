extends BaseScreen


func _ready() -> void:
	poll_screen_manager(Enums.SCREENS.MAIN_MENU)
	MusicManager.play_song("res://assets/music/Godot_Slurp_Master1.ogg")


func _on_GithubLinkButton_button_up() -> int:
	return OS.shell_open("https://github.com/KapFlagon/GHGO2020")


func _on_NewGameButton_button_up():
	ScreenManager.next_screen(Enums.SCREENS.INTRO)


func _on_Credits_button_up() -> void:
	ScreenManager.next_screen(Enums.SCREENS.CREDITS)


func _on_HowToPlayButton_button_up() -> void:
	ScreenManager.next_screen(Enums.SCREENS.HOWTOPLAY)


func _on_LevelSelectButton_button_up():
	ScreenManager.next_screen(Enums.SCREENS.LEVELSELECT)


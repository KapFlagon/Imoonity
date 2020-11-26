extends BaseScreen


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	poll_screen_manager(Enums.SCREENS.MAIN_MENU)
	pass # Replace with function body.


func _on_GithubLinkButton_button_up() -> int:
	return OS.shell_open("https://github.com/KapFlagon/GHGO2020")


func _on_PlayButton_button_up() -> void:
	ScreenManager.next_screen(Enums.SCREENS.INTRO)


func _on_Credits_button_up() -> void:
	ScreenManager.next_screen(Enums.SCREENS.CREDITS)


func _on_HowToPlayButton_button_up() -> void:
	ScreenManager.next_screen(Enums.SCREENS.HOWTOPLAY)

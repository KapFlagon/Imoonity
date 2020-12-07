extends BaseScreen


func _ready():
	poll_screen_manager(Enums.SCREENS.INTRO)


func _on_SyndiBox_text_finished() -> void:
	cutscene_over()


func _on_SkipButton_button_up() -> void:
	cutscene_over()


func cutscene_over() -> void:
	ScreenManager.next_screen()

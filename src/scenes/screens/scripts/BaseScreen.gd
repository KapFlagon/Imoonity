extends Control

class_name BaseScreen

func poll_screen_manager(this_screen_value: int) -> void:
	ScreenManager.set_current_screen(this_screen_value)

extends Control

class_name BaseScreen

func poll_screen_manager(this_screen_value: int) -> void:
	if ScreenManager.get_current_screen() == -1:
		ScreenManager.set_current_screen(this_screen_value)

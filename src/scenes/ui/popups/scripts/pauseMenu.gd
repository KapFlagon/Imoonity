extends Popup


func update_display_location(camera_center: Vector2) -> void:
	var width = rect_size.x * rect_scale.x
	var height = rect_size.y * rect_scale.y
	var x = camera_center.x - (width / 2)
	var y = camera_center.y - (height / 2) 
	var new_position = Vector2(x, y)
	popup()
	rect_position = new_position


func pause_game() -> void:
	get_tree().paused = true


func un_pause_game() -> void:
	get_tree().paused = false
	hide()


func _on_resetLevel_button_up():
	get_tree().reload_current_scene()


func _on_mainMenu_button_up():
	ScreenManager.next_screen(Enums.SCREENS.MAIN_MENU)
#	MusicManager.music_player.stop()


func _on_cancel_button_up():
	un_pause_game()


func _on_pauseMenu_about_to_show():
	pause_game()

func _on_pauseMenu_popup_hide():
	un_pause_game()


func show_interface(camera_center: Vector2) -> void:
	pause_game()
	update_display_location(camera_center)

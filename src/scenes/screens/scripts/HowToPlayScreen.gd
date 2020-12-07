extends BaseScreen


var current_page: int = 1


func _ready():
	poll_screen_manager(Enums.SCREENS.HOWTOPLAY)
	update_page()


func update_page() -> void:
	update_display()
	update_buttons()


func update_display() -> void:
	match current_page:
		1:
#			$SubVBoxContainer/ProgrammersTitle.show()
			pass
		2:
#			$SubVBoxContainer/ProgrammersTitle.hide()
			pass


func update_buttons() -> void:
	match current_page:
		1:
			$BtnHBoxContainer/BackBtn.disabled = true
			$BtnHBoxContainer/NextBtn.disabled = false
		2:
			$BtnHBoxContainer/BackBtn.disabled = false
			$BtnHBoxContainer/NextBtn.disabled = true


func _on_NextBtn_button_up() -> void:
	current_page += 1
	update_page()


func _on_BackBtn_button_up() -> void:
	current_page -= 1
	update_page()


func _on_MainMenuBtn_button_up() -> void:
	ScreenManager.next_screen(Enums.SCREENS.MAIN_MENU)

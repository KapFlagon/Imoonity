extends BaseScreen


var current_page: int


func _ready() -> void:
	poll_screen_manager(Enums.SCREENS.CREDITS)
	current_page = 1
	update_page()


func update_page() -> void:
	update_display()
	update_buttons()


func update_display() -> void:
	match current_page:
		1:
			$TopVBoxContainer/ProgrammersTitle.show()
			$TopVBoxContainer/ProgrammersVBox.show()
			$TopVBoxContainer/AudioAndMusicTitle.show()
			$TopVBoxContainer/AudioAndMusicVBox.show()
			$TopVBoxContainer/HonourableMentionsTitle.hide()
			$TopVBoxContainer/HonourableMentionsSubTitle.hide()
			$TopVBoxContainer/HonourableMentionsVBox.hide()
		2:
			$TopVBoxContainer/ProgrammersTitle.hide()
			$TopVBoxContainer/ProgrammersVBox.hide()
			$TopVBoxContainer/AudioAndMusicTitle.hide()
			$TopVBoxContainer/AudioAndMusicVBox.hide()
			$TopVBoxContainer/HonourableMentionsTitle.show()
			$TopVBoxContainer/HonourableMentionsSubTitle.show()
			$TopVBoxContainer/HonourableMentionsVBox.show()


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


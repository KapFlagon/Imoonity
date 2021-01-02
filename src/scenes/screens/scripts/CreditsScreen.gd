extends BaseScreen


var current_page: int = 1


func _ready() -> void:
	poll_screen_manager(Enums.SCREENS.CREDITS)
	update_page()


func update_page() -> void:
	update_display()
	update_buttons()


func update_display() -> void:
	match current_page:
		1:
			$SubVBoxContainer/ProgrammersTitle.show()
			$SubVBoxContainer/ProgrammersVBox.show()
			$SubVBoxContainer/AudioAndMusicTitle.show()
			$SubVBoxContainer/AudioAndMusicVBox.show()
			$SubVBoxContainer/HonourableMentionsTitle.hide()
			$SubVBoxContainer/HonourableMentionsSubTitle.hide()
			$SubVBoxContainer/HonourableMentionsVBox.hide()
		2:
			$SubVBoxContainer/ProgrammersTitle.hide()
			$SubVBoxContainer/ProgrammersVBox.hide()
			$SubVBoxContainer/AudioAndMusicTitle.hide()
			$SubVBoxContainer/AudioAndMusicVBox.hide()
			$SubVBoxContainer/HonourableMentionsTitle.show()
			$SubVBoxContainer/HonourableMentionsSubTitle.show()
			$SubVBoxContainer/HonourableMentionsVBox.show()


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


func _on_KapFlagonGitHubLinkBtn_button_up() -> int:
	return OS.shell_open("https://github.com/KapFlagon")


func _on_KapFlagonItchLinkBtn_button_up() -> int:
	return OS.shell_open("https://kapflagon.itch.io/")


func _on_JibblyCGitHubLinkBtn_button_up() -> int:
	return OS.shell_open("https://github.com/JibblyC")


func _on_JibblyCItchLinkBtn_button_up() -> int:
	return OS.shell_open("https://yummyjibblybits.itch.io/")


func _on_GiantSpaceRobotGitHubLinkBtn_button_up() -> int:
	return OS.shell_open("https://github.com/GiantSpaceRobot")


func _on_GiantSpaceRobotItchLinkBtn_button_up() -> int:
	return OS.shell_open("https://giantspacerobot.itch.io/")


func _on_DexyodGitHubLinkBtn_button_up() -> int:
	return OS.shell_open("https://github.com/Dexyod")


func _on_GiantSpaceRobotSoundcloudLinkBtn_button_up() -> int:
	return OS.shell_open("https://soundcloud.com/paul-donovan-755480553")


func _on_KenCoderSoundcloudLinkBtn_button_up() -> int:
	return OS.shell_open("https://soundcloud.com/ken-baker")


func _on_AdamAtomicSrcLnkBtn_button_up() -> int:
	return OS.shell_open("https://adamatomic.itch.io/abandonauts")


func _on_PixelSagasSrcLnkBtn_button_up() -> int:
	return OS.shell_open("https://www.fontspace.com/pixel-coleco-font-f21542")


func _on_SudospectiveSrcLnkBtn_button_up() -> int:
	return OS.shell_open("https://github.com/Sudospective/syndibox")


func _on_HelianthusGamesSrcLnkBtn_button_up() -> int:
	return OS.shell_open("https://helianthus-games.itch.io/pixel-art-planets")


func _on_ansimuzGamesSrcLnkBtn_button_up():
	return OS.shell_open("https://ansimuz.itch.io/mountain-dusk-parallax-background")

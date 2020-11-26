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


func _on_KapFlagonGitHubLinkBtn_button_up() -> int:
	return OS.shell_open("https://github.com/KapFlagon")


func _on_KapFlagonItchLinkBtn_button_up() -> int:
	return OS.shell_open("https://kapflagon.itch.io/")


func _on_JibblyCGitHubLinkBtn_button_up() -> int:
	return OS.shell_open("https://github.com/JibblyC")


func _on_JibblyCItchLinkBtn_button_up() -> void:
	# TODO: update with the correct Itch.io link
	pass # Replace with function body.


func _on_GiantSpaceRobotGitHubLinkBtn_button_up() -> int:
	return OS.shell_open("https://github.com/GiantSpaceRobot")


func _on_GiantSpaceRobotItchLinkBtn_button_up() -> void:
	# TODO: update with the correct Itch.io link
	pass # Replace with function body.



func _on_DexyodGitHubLinkBtn_button_up() -> int:
	return OS.shell_open("https://github.com/Dexyod")


func _on_DexyodItchLinkBtn_button_up() -> void:
	# TODO: update with the correct Itch.io link
	pass # Replace with function body.


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

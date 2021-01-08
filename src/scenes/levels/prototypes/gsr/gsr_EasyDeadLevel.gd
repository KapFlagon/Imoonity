extends BaseLevel


func _ready():
	set_level_screen_value(Enums.SCREENS.GSR_EASY_DEAD_LEVEL)
	get_node("Player/Camera2D/PlayerHud").update_level_text()


func _on_BridgeButton_button_just_pressed():
	$BridgeContainer/Bridge.rotateBridge()


func _on_BridgeButton2_button_just_pressed():
	$BridgeContainer/Bridge2.rotateBridge()
	$BridgeContainer/Bridge3.rotateBridge()
	$BridgeContainer/Bridge4.rotateBridge()
	$BridgeContainer/Bridge5.rotateBridge()

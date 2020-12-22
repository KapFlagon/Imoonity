extends BaseLevel

func _ready():
	get_node("Player/Camera2D").zoom.x = 1
	get_node("Player/Camera2D").zoom.y = 1
	background.scale = Vector2(1.3,1.3)


func _on_Button_button_just_pressed():
	$BridgeContainer/Bridge.rotateBridge()
	$BridgeContainer/Bridge2.rotateBridge()
	$BridgeContainer/Bridge5.rotateBridge()
	$BridgeContainer/Bridge8.rotateBridge()


func _on_Button2_button_just_pressed():
	$BridgeContainer/Bridge2.rotateBridge()
	$BridgeContainer/Bridge3.rotateBridge()
	$BridgeContainer/Bridge4.rotateBridge()
	$BridgeContainer/Bridge7.rotateBridge()
	$BridgeContainer/Bridge8.rotateBridge()

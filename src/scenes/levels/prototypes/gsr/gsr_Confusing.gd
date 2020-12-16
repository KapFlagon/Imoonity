extends BaseLevel

func _ready():
	get_node("Player/Camera2D").zoom.x = 1
	get_node("Player/Camera2D").zoom.y = 1

func _on_BridgeButton_button_just_pressed():
	$BridgeContainer/Bridge.rotateBridge()
	$BridgeContainer/Bridge2.rotateBridge()
	$BridgeContainer/Bridge5.rotateBridge()


func _on_BridgeButton2_button_just_pressed():
	$BridgeContainer/Bridge2.rotateBridge()
	$BridgeContainer/Bridge3.rotateBridge()
	$BridgeContainer/Bridge4.rotateBridge()

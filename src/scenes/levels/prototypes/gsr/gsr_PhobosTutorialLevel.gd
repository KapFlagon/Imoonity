extends BaseLevel

func _process(delta):
	pass#$BackgroundParent.position = $Player/Camera2D.get_camera_screen_center()


func _on_BridgeButton_button_just_pressed():
	$BridgeContainer/Bridge.rotateBridge()


func _on_BridgeButton2_button_just_pressed():
	$BridgeContainer/Bridge2.rotateBridge()


func _on_BridgeButton3_button_just_pressed():
	$BridgeContainer/Bridge3.rotateBridge()

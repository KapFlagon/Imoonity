extends BaseLevel




func _on_Button_button_unpressed():
	print("Button unpressed")


func _on_Button_button_pressed():
	print("Button still pressed")



func _on_Button_button_just_pressed():
	print("Button just pressed")


func _on_Button2_button_just_pressed():
	$SpikeContainer/Spike.flip_active_state()


func _on_Button3_button_just_pressed():
	$LauncherContainer/Launcher.flip_active_state()


func _on_Button4_button_just_pressed():
	$BridgeContainer/Bridge.rotateBridge()



func _on_Button7_button_just_pressed():
	$HomingObstContainer/HomingObstacle.flip_active_state()

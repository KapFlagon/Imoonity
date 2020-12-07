extends BaseLevel



func _on_BridgeButton_pressed():
	var bridge = get_node("BridgeContainer/Bridge")
	if !bridge.animPlayer.is_playing():
		bridge.rotateBridge()


func _on_BridgeButton2_pressed():
	var bridge = get_node("BridgeContainer/Bridge2")
	if !bridge.animPlayer.is_playing():
		bridge.rotateBridge()


func _on_BridgeButton3_pressed():
	var bridge = get_node("BridgeContainer/Bridge3")
	if !bridge.animPlayer.is_playing():
		bridge.rotateBridge()

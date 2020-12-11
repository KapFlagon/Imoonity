extends BaseLevel


func _on_Button_pressed():
	var bridge = get_node("BridgeContainer/Bridge")
	if !bridge.animPlayer.is_playing():
		bridge.rotateBridge()

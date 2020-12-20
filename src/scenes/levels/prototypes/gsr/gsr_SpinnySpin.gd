extends BaseLevel



func _on_Button_button_pressed():
	var puzzle_bridge = get_node("BridgeContainer/Bridge")
	if not puzzle_bridge.is_bridge_open():
		$BridgeContainer/Bridge.rotateBridge()
		$BridgeContainer/Bridge2.rotateBridge()
		$BridgeContainer/Bridge3.rotateBridge()


func _on_Button_button_unpressed():
	var puzzle_bridge1 = get_node("BridgeContainer/Bridge")
	var puzzle_bridge2 = get_node("BridgeContainer/Bridge2")
	var puzzle_bridge3 = get_node("BridgeContainer/Bridge3")
	if puzzle_bridge1.is_bridge_open():
		puzzle_bridge1._anim_player.stop(false)
		puzzle_bridge1._anim_player.play_backwards()
		puzzle_bridge1.set_bridge_open(false)
		puzzle_bridge2._anim_player.stop(false)
		puzzle_bridge2._anim_player.play_backwards()
		puzzle_bridge2.set_bridge_open(false)
		puzzle_bridge3._anim_player.stop(false)
		puzzle_bridge3._anim_player.play_backwards()
		puzzle_bridge3.set_bridge_open(false)

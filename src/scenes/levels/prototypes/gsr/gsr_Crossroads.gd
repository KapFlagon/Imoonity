extends BaseLevel


func _on_Button_button_just_pressed():
	$BridgeContainer/Bridge.rotateBridge()
	$BridgeContainer/Bridge2.rotateBridge()
	$BridgeContainer/Bridge3.rotateBridge()

func _on_Button2_button_just_pressed():
	flip_all_spikes()


func flip_all_spikes() -> void:
	for each_spike in get_node("SpikeContainer").get_children():
		each_spike.flip_active_state()


func flip_all_launchers() -> void:
	for each_launcher in get_node("LauncherContainer").get_children():
		each_launcher.flip_active_state()


func _on_Button3_button_just_pressed():
	flip_all_launchers()
	$BridgeContainer/Bridge4.rotateBridge()
	$BridgeContainer/Bridge5.rotateBridge()



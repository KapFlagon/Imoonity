extends BaseLevel


func _ready():
	PowerManager.reset_all_equippment()
	set_level_screen_value(Enums.SCREENS.GSR_PHOBOS_TUTORIAL_LEVEL)


func _process(delta):
	pass#$BackgroundParent.position = $Player/Camera2D.get_camera_screen_center()


func _on_BridgeButton_button_just_pressed():
	$BridgeContainer/Bridge.rotateBridge()


func _on_BridgeButton2_button_just_pressed():
	$BridgeContainer/Bridge2.rotateBridge()


func _on_BridgeButton3_button_just_pressed():
	$BridgeContainer/Bridge3.rotateBridge()


func _on_BridgeButton4_button_pressed():
	if $SpikeContainer/Spike.is_obstacle_active():
		for spike in $SpikeContainer.get_children():
			spike.flip_active_state()


func _on_BridgeButton4_button_unpressed():
	if !$SpikeContainer/Spike.is_obstacle_active():
		for spike in $SpikeContainer.get_children():
			spike.flip_active_state()

extends BaseLevel

func _ready():
	set_level_screen_value(Enums.SCREENS.GSR_EXPERT_MODE)
	._ready()
	

func _on_BridgeButton_pressed():
	var bridge = get_node("BridgeContainer/Bridge")
	if !bridge.animPlayer.is_playing():
		bridge.rotateBridge()


func _on_BridgeButton2_pressed():
	var bridge = get_node("BridgeContainer/Bridge2")
	if !bridge.animPlayer.is_playing():
		bridge.rotateBridge()

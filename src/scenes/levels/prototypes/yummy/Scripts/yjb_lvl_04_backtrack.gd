extends BaseLevel

func _ready():
	set_level_screen_value(Enums.SCREENS.YJB_LVL_04_BACKTRACK)
	get_node("Player/Camera2D/PlayerHud").update_level_text()


func _on_Button_button_pressed():
	var bridge = get_node("BridgeContainer/Bridge_open_exit")
	if not bridge.is_bridge_open():
		bridge.rotateBridge()


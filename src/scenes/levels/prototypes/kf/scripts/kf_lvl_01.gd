extends BaseLevel


func _ready():
	PowerManager.reset_all_equippment()
	set_level_screen_value(Enums.SCREENS.KF_LVL_01)


func _on_Button_pressed() -> void:
	var bridge = get_node("BridgeContainer/Bridge")
	if !bridge.animPlayer.is_playing():
		bridge.rotateBridge()


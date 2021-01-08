extends BaseLevel


func _ready():
	set_level_screen_value(Enums.SCREENS.KF_LVL_01)
	get_node("Player/Camera2D/PlayerHud").update_level_text()


func _on_Button_pressed() -> void:
	var bridge = get_node("BridgeContainer/Bridge")
	if !bridge.animPlayer.is_playing():
		bridge.rotateBridge()



func _on_LevelExit_level_ended():
	PowerManager.reset_all_equippment()

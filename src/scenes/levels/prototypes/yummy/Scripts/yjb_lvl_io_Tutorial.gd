extends BaseLevel


func _ready():
	set_level_screen_value(Enums.SCREENS.YJB_LVL_IO_TUTORIAL)
	get_node("Player/Camera2D/PlayerHud").update_level_text()


func _on_LevelExit_level_ended():
#	PowerManager.reset_all_equippment()
	pass

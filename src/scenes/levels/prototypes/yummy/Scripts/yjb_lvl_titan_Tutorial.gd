extends BaseLevel


func _ready():
	set_level_screen_value(Enums.SCREENS.YJB_LVL_TITAN_TUTORIAL)


func _on_LevelExit_level_ended():
#	PowerManager.reset_all_equippment()
	pass

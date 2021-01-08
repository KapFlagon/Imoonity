extends BaseLevel


func _ready():
	set_level_screen_value(Enums.SCREENS.YJB_LVL_02_TITAN_FOCUSED)
	get_node("Player/Camera2D/PlayerHud").update_level_text()

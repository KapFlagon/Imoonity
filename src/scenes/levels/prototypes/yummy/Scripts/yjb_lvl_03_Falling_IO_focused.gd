extends BaseLevel


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	set_level_screen_value(Enums.SCREENS.YJB_LVL_03_FALLING_IO_FOCUSED)
	get_node("Player/Camera2D/PlayerHud").update_level_text()


# Called every frame. 'delta' is the elapsed time since the previous frame.s
#func _process(delta):
#	pass


func _on_Button_button_just_pressed():
	$BridgeContainer/Bridge.rotateBridge()

extends BaseLevel


func _ready():
	set_level_screen_value(Enums.SCREENS.GSR_PUZZLE)
	get_node("Player/Camera2D/PlayerHud").update_level_text()


func _on_Button_button_just_pressed():
	$BridgeContainer/Bridge.rotateBridge()


func _on_Button2_button_just_pressed():
	$PathObstContainer/PathObstacle.set_movement_speed(50)


func _on_Button3_button_just_pressed():
	$PathObstContainer/PathObstacle2.set_movement_speed(50)


func _on_Button4_button_just_pressed():
	$PathObstContainer/PathObstacle3.set_movement_speed(50)


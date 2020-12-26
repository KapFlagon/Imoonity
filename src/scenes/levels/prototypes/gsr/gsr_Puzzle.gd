extends BaseLevel


func _ready():
	pass


func _on_Button_button_just_pressed():
	$BridgeContainer/Bridge.rotateBridge()


func _on_Button2_button_just_pressed():
	$PathObstContainer/PathObstacle.set_movement_speed(50)


func _on_Button3_button_just_pressed():
	$PathObstContainer/PathObstacle2.set_movement_speed(50)


func _on_Button4_button_just_pressed():
	$PathObstContainer/PathObstacle3.set_movement_speed(50)


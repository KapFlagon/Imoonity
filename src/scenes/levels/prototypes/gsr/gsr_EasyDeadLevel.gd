extends BaseLevel


func _ready():
	pass#MusicManager.play_song("res://assets/music/Godot_Escape_Master1.wav")


func _on_BridgeButton_button_just_pressed():
	$BridgeContainer/Bridge.rotateBridge()


func _on_BridgeButton2_button_just_pressed():
	$BridgeContainer/Bridge2.rotateBridge()
	$BridgeContainer/Bridge3.rotateBridge()
	$BridgeContainer/Bridge4.rotateBridge()
	$BridgeContainer/Bridge5.rotateBridge()

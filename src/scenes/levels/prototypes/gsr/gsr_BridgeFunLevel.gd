extends BaseLevel


func _ready():
	pass#MusicManager.play_song("res://assets/music/Godot_Slurp_Master1.ogg")


func _on_BridgeButton_button_just_pressed():
	$BridgeContainer/Bridge.rotateBridge()


func _on_BridgeButton2_button_just_pressed():
	$BridgeContainer/Bridge2.rotateBridge()

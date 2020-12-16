extends BaseLevel

func _ready():
	pass#MusicManager.play_song("res://assets/music/Godot_QuantisedFunk_Master1.wav")

#
#func _on_BridgeButton2_pressed():
#	var bridge = get_node("BridgeContainer/Bridge2")
#	if !bridge.animPlayer.is_playing():
#		bridge.rotateBridge()
#
#
#func _on_BridgeButton3_pressed():
#	var bridge = get_node("BridgeContainer/Bridge3")
#	if !bridge.animPlayer.is_playing():
#		bridge.rotateBridge()


func _on_BridgeButton_button_just_pressed():
	$BridgeContainer/Bridge.rotateBridge()


func _on_BridgeButton2_button_just_pressed():
	$BridgeContainer/Bridge2.rotateBridge()


func _on_BridgeButton3_button_just_pressed():
	$BridgeContainer/Bridge3.rotateBridge()

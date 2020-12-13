extends BaseLevel


func _ready():
	pass#MusicManager.play_song("res://assets/music/Godot_Escape_Master1.wav")


func _on_BridgeButton_pressed():
	var bridge = get_node("BridgeContainer/Bridge")
	if !bridge.animPlayer.is_playing():
		bridge.rotateBridge()


func _on_BridgeButton2_pressed():
	var bridge2 = get_node("BridgeContainer/Bridge2")
	if !bridge2.animPlayer.is_playing():
		bridge2.rotateBridge()
	var bridge3 = get_node("BridgeContainer/Bridge3")
	if !bridge3.animPlayer.is_playing():
		bridge3.rotateBridge()
	var bridge4 = get_node("BridgeContainer/Bridge4")
	if !bridge4.animPlayer.is_playing():
		bridge4.rotateBridge()
	var bridge5 = get_node("BridgeContainer/Bridge5")
	if !bridge5.animPlayer.is_playing():
		bridge5.rotateBridge()

func _on_BridgeButton3_pressed():
	pass # Replace with function body.

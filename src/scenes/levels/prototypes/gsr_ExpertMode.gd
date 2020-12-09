extends BaseLevel

func _ready():
	MusicManager.play_song("res://assets/music/Godot_QuantisedFunk_Master1.wav")
	# Hi everyone

func _on_BridgeButton_pressed():
	var bridge = get_node("BridgeContainer/Bridge")
	if !bridge.animPlayer.is_playing():
		bridge.rotateBridge()


func _on_BridgeButton2_pressed():
	var bridge = get_node("BridgeContainer/Bridge2")
	if !bridge.animPlayer.is_playing():
		bridge.rotateBridge()

extends BaseLevel


func _ready():
	MusicManager.play_song("res://assets/music/Godot_Slurp_Master1.ogg")

func _on_BridgeButton_pressed():
	var bridge = get_node("BridgeContainer/Bridge")
	if !bridge.animPlayer.is_playing():
		bridge.rotateBridge()


func _on_BridgeButton2_pressed():
	var bridge = get_node("BridgeContainer/Bridge2")
	if !bridge.animPlayer.is_playing():
		bridge.rotateBridge()

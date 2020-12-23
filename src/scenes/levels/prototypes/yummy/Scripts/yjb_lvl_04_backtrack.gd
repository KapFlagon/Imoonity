extends BaseLevel

func _ready():
#	MusicManager.play_song("res://assets/music/Godot_Slurp_Master1.ogg")
	pass
	
	


func _on_Button_button_pressed():
	var bridge = get_node("BridgeContainer/Bridge_open_exit")
	if not bridge.is_bridge_open():
		bridge.rotateBridge()


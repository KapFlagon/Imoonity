extends BaseLevel

func _ready():
	get_node("Player/Camera2D").zoom.x = 1
	get_node("Player/Camera2D").zoom.y = 1

func _on_BridgeButton_pressed():
	var bridge = get_node("BridgeContainer/Bridge")
	if !bridge.animPlayer.is_playing():
		bridge.rotateBridge()
	var bridge2 = get_node("BridgeContainer/Bridge2")
	if !bridge2.animPlayer.is_playing():
		bridge2.rotateBridge()
	var bridge5 = get_node("BridgeContainer/Bridge5")
	if !bridge5.animPlayer.is_playing():
		bridge5.rotateBridge()


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

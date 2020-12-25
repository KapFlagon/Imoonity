extends BaseLevel


onready var room_02_puzzle_bridge_a = get_node("BridgeContainer/Bridge_Room_02_Puzzle_a")
onready var room_02_puzzle_bridge_b = get_node("BridgeContainer/Bridge_Room_02_Puzzle_b")
onready var room_02_puzzle_bridge_c = get_node("BridgeContainer/Bridge_Room_02_Puzzle_c")
onready var room_02_puzzle_bridge_d = get_node("BridgeContainer/Bridge_Room_02_Puzzle_d")
onready var room_02_puzzle_bridge_e = get_node("BridgeContainer/Bridge_Room_02_Puzzle_e")


func _ready():
	set_level_screen_value(Enums.SCREENS.KF_LVL_THE_PIT)
	._ready()


func _on_Button_Room_01_Exit_button_just_pressed():
	get_node("BridgeContainer/Bridge_Room_01").rotateBridge()


func _on_Room_01_Exit_Area2D_area_entered(area):
	if area.get_parent().name == "Player":
		get_node("BridgeContainer/Bridge_Room_01").rotateBridge()



func _on_Button_Room_02_Puzzle_a_button_just_pressed():
	if not is_rotation_playing_in_room_2_puzzle():
		room_02_puzzle_bridge_a.rotateBridge()
		room_02_puzzle_bridge_c.rotateBridge()
		room_02_puzzle_bridge_e.rotateBridge()


func _on_Button_Room_02_Puzzle_b_button_just_pressed():
	if not is_rotation_playing_in_room_2_puzzle():
		room_02_puzzle_bridge_b.rotateBridge()
		room_02_puzzle_bridge_d.rotateBridge()
		room_02_puzzle_bridge_a.rotateBridge()


func _on_Button_Room_02_Puzzle_c_button_just_pressed():
	if not is_rotation_playing_in_room_2_puzzle():
		room_02_puzzle_bridge_a.rotateBridge()
		room_02_puzzle_bridge_b.rotateBridge()
		room_02_puzzle_bridge_c.rotateBridge()
		room_02_puzzle_bridge_e.rotateBridge()


func is_rotation_playing_in_room_2_puzzle() -> bool:
	if room_02_puzzle_bridge_a.is_bridge_rotating() or room_02_puzzle_bridge_b.is_bridge_rotating() or room_02_puzzle_bridge_c.is_bridge_rotating() or room_02_puzzle_bridge_d.is_bridge_rotating():
		return true
	else:
		return false


func _on_Button_Room_02_Exit_button_just_pressed():
	get_node("BridgeContainer/Bridge_Room_02_Exit").rotateBridge()


func _on_Room_02_Exit_Area2D_area_entered(area):
	if area.get_parent().name == "Player":
		get_node("BridgeContainer/Bridge_Room_02_Exit").rotateBridge()


func _on_Button_Room_03_Puzzle_button_pressed():
	var puzzle_bridge = get_node("BridgeContainer/Bridge_Room_03_Puzzle")
	if not puzzle_bridge.is_bridge_open():
		puzzle_bridge.rotateBridge()


func _on_Button_Room_03_Puzzle_button_unpressed():
	var puzzle_bridge = get_node("BridgeContainer/Bridge_Room_03_Puzzle")
	if puzzle_bridge.is_bridge_open():
		puzzle_bridge._anim_player.stop(false)
		puzzle_bridge._anim_player.play_backwards()
		puzzle_bridge.set_bridge_open(false)


func _on_Button_Room_03_Exit_button_just_pressed():
	get_node("BridgeContainer/Bridge_Room_03_Exit").rotateBridge()

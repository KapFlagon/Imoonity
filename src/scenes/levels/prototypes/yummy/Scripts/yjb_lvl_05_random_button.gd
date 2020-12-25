extends BaseLevel

var chosenButton


func _ready():
#	MusicManager.play_song("res://assets/music/Godot_Slurp_Master1.ogg")
	set_level_screen_value(Enums.SCREENS.YJB_LVL_05_RANDOM_BUTTON)
	var listOfButtons = []
	listOfButtons.push_back(get_node("ButtonContainer/bot_left_button")) 
	listOfButtons.push_back(get_node("ButtonContainer/top_left_button"))
	listOfButtons.push_back(get_node("ButtonContainer/top_right_button"))
	listOfButtons.push_back(get_node("ButtonContainer/bot_right_button"))
	listOfButtons.push_back(get_node("ButtonContainer/wall_left_button"))
	listOfButtons.push_back(get_node("ButtonContainer/wall_right_button"))

	randomize()
	chosenButton =  listOfButtons[randi() % listOfButtons.size()]
	print(chosenButton.name)
	._ready()


func rotate_bridges():
	var bridge_right = get_node("BridgeContainer/Bridge_right")
	var bridge_left = get_node("BridgeContainer/Bridge_left")
	if not bridge_right.is_bridge_open():
		bridge_right.rotateBridge()
	if not bridge_left.is_bridge_open():
		bridge_left.rotateBridge()


func _on_bot_left_button_button_just_pressed():
	if chosenButton.name == "bot_left_button":
		rotate_bridges()
		

func _on_top_left_button_button_just_pressed():
	if chosenButton.name == "top_left_button":
		rotate_bridges()


func _on_top_right_button_button_just_pressed():
	if chosenButton.name == "top_right_button":
		rotate_bridges()


func _on_bot_right_button_button_just_pressed():
	if chosenButton.name == "bot_right_button":
		rotate_bridges()


func _on_wall_right_button_button_just_pressed():
	if chosenButton.name == "wall_right_button":
		rotate_bridges()


func _on_wall_left_button_button_just_pressed():
	if chosenButton.name == "wall_left_button":
		rotate_bridges()

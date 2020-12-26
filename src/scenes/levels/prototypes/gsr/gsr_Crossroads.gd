extends BaseLevel


onready var bridge = get_node("BridgeContainer/Bridge")
onready var bridge2 = get_node("BridgeContainer/Bridge2")
onready var bridge3 = get_node("BridgeContainer/Bridge3")
onready var bridge4 = get_node("BridgeContainer/Bridge4")
onready var bridge5 = get_node("BridgeContainer/Bridge5")
var bridge_dict = {}


func _ready():
	set_level_screen_value(Enums.SCREENS.GSR_CROSSROADS)
	init_bridge_dict()
	pull_dict_from_screen_manager()


func init_bridge_dict():
	bridge_dict[bridge.name] = bridge.is_bridge_open()
	bridge_dict[bridge2.name] = bridge2.is_bridge_open()
	bridge_dict[bridge3.name] = bridge3.is_bridge_open()
	bridge_dict[bridge4.name] = bridge4.is_bridge_open()
	bridge_dict[bridge5.name] = bridge5.is_bridge_open()


func update_bridge_dict(single_bridge):
	bridge_dict[single_bridge.name] = single_bridge.is_bridge_open()


func _on_Button_button_just_pressed():
	bridge.rotateBridge()
	update_bridge_dict(bridge)
	bridge2.rotateBridge()
	update_bridge_dict(bridge2)
	bridge3.rotateBridge()
	update_bridge_dict(bridge3)
	push_dict_to_screen_manager()

func _on_Button2_button_just_pressed():
	flip_all_spikes()


func flip_all_spikes() -> void:
	for each_spike in get_node("SpikeContainer").get_children():
		each_spike.flip_active_state()


func flip_all_launchers() -> void:
	for each_launcher in get_node("LauncherContainer").get_children():
		each_launcher.flip_active_state()


func _on_Button3_button_just_pressed():
	flip_all_launchers()
	bridge4.rotateBridge()
	update_bridge_dict(bridge4)
	bridge5.rotateBridge()
	update_bridge_dict(bridge5)
	push_dict_to_screen_manager()


func pull_dict_from_screen_manager():
	if ScreenManager.get_dict().size() == bridge_dict.size():
		bridge_dict.clear()
		bridge_dict = ScreenManager.get_dict().duplicate()
		update_bridges()


func update_bridges():
	update_single_bridge(bridge)
	update_single_bridge(bridge2)
	update_single_bridge(bridge3)
	update_single_bridge(bridge4)
	update_single_bridge(bridge5)


func update_single_bridge(single_bridge):
	var bridge_state = single_bridge.is_bridge_open()
	var dict_state = bridge_dict.get(single_bridge.name)
	if bridge_state != dict_state:
		single_bridge.rotateBridge()


func push_dict_to_screen_manager():
	ScreenManager.update_dict(bridge_dict)


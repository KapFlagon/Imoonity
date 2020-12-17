extends BaseLevel


var _moving_spikes_visibility_enabled: bool
var _moving_spikes_enabled: bool = false
var _level_building = false
var _master_button_pressed = false


onready var moving_spikes = get_node("MovingSpikeContainer")
onready var bridge_01 = get_node("BridgeContainer/Bridge")
onready var bridge_02 = get_node("BridgeContainer/Bridge2")
onready var bridge_03 = get_node("BridgeContainer/Bridge3")


func _process(delta):
	if _moving_spikes_enabled and not _level_building:
		update_moving_spikes() 
	else: 
		is_moving_spikes_start_point_passed()


func _disable_moving_spike_visibility_enabler() -> void:
	for spike in moving_spikes.get_children():
		spike._disconnect_visibility_enabler_signals()


func update_moving_spikes() -> void:
	var player = get_node("Player")
	if player_has_outrun_spikes(player, moving_spikes):
		moving_spikes.position.x = player.position.x + 160
		moving_spikes.position.y = player.position.y
	moving_spikes.position.x -= 0.8


func player_has_outrun_spikes(player, spikes) -> bool:
	var distance = spikes.position.x - player.position.x
	if (distance) > 170:
		return true
	else: 
		return false


func activate_moving_spikes() -> void:
	_moving_spikes_enabled = true


func is_moving_spikes_start_point_passed():
	var player = get_node("Player")
	var hint_box = get_node("HintBoxContainer/HintBox2")
	if player.position.x < hint_box.position.x:
		activate_moving_spikes()
	pass


func _on_MasterButton_button_just_pressed():
	bridge_01.rotateBridge()
	bridge_02.rotateBridge()
	bridge_03.rotateBridge()
	_master_button_pressed = true


func _on_Button2_button_just_pressed():
	if not _master_button_pressed:
		bridge_01.rotateBridge()


func _on_Button3_button_just_pressed():
	if not _master_button_pressed:
		bridge_02.rotateBridge()


func _on_Button4_button_just_pressed():
	if not _master_button_pressed:
		bridge_03.rotateBridge()

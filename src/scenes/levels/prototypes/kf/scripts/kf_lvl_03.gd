extends BaseLevel


var _moving_spikes_visibility_enabled: bool
var _moving_spikes_enabled: bool = false
var _level_building = true


onready var moving_spikes = get_node("MovingSpikeContainer")


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

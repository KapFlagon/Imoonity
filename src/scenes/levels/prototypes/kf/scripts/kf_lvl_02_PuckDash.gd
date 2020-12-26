extends BaseLevel


func _ready():
	PowerManager.reset_all_equippment()
	set_level_screen_value(Enums.SCREENS.KF_LVL_02_PUCK_DASH)


func _on_Button_button_just_pressed():
	if not get_node("TimerContainer/SpikeTimer").time_left > 0:
		flip_all_spikes()
		get_node("TimerContainer/SpikeTimer").start()

func _on_SpikeTimer_timeout():
	flip_all_spikes()
	get_node("TimerContainer/SpikeTimer").stop()


func flip_all_spikes() -> void:
	for each_spike in get_node("SpikeContainer").get_children():
		each_spike.flip_active_state()


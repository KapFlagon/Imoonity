extends BaseLevel


func _on_Button_button_just_pressed():
	flip_all_spikes()
	get_node("TimerContainer/SpikeTimer").start()


func _on_SpikeTimer_timeout():
	flip_all_spikes()
	get_node("TimerContainer/SpikeTimer").stop()


func flip_all_spikes() -> void:
	for each_spike in get_node("SpikeContainer").get_children():
		each_spike.flip_active_state()


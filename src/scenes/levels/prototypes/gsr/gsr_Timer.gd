extends BaseLevel


var timer


func _on_Button_button_just_pressed():
	flip_all_launchers()
	$SpinnerContainer/Spinner.flip_active_state()


func flip_all_launchers() -> void:
	for each_launcher in get_node("LauncherContainer").get_children():
		each_launcher.flip_active_state()


func _ready():
	timer = Timer.new()
	timer.connect("timeout",self,"_on_timer_timeout") 
	add_child(timer) #to process
	timer.start() #to start


func _on_timer_timeout():
	flip_all_spikes()


func flip_all_spikes() -> void:
	for each_spike in get_node("SpikeContainer").get_children():
		each_spike.flip_active_state()

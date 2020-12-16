extends BaseLevel


var _moving_spikes_visibility_enabled: bool


onready var moving_spikes = get_node("MovingSpikeContainer")


#func _ready():
#	_disable_moving_spike_visibility_enabler()


func _process(delta):
	moving_spikes.position.x -= 2.3
#	TODO: Need to ensure that the spikes stay active


func _disable_moving_spike_visibility_enabler() -> void:
	for spike in moving_spikes.get_children():
		spike._disconnect_visibility_enabler_signals()

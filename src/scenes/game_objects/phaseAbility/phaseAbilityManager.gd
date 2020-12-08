extends Node

signal power_triggered(power_active)
signal phase_timer_elapsing(percentage_elapsed)

var playerScene 
var power_active: bool = false setget set_power_active, is_power_active
export (float) var active_time_seconds = 3
export (float) var cooldown_time_seconds = 3
var power_available: bool = true


# Called when the node enters the scene tree for the first time.
func _ready():
	playerScene = get_parent()
	$ActiveTimer.set_wait_time(active_time_seconds)
	$CoolDownTimer.set_wait_time(cooldown_time_seconds)
	
func _process(delta) -> void:
	broadcast_elapsed_time_percentage()
	

func checkActionButtonPressed():
	if PowerManager.is_io_equipped() and Input.is_action_just_pressed("action_phase"):
		if(!power_active && power_available):
			$ActiveTimer.start()
			get_tree().call_group("phasingMaterial","_remove_from_lethal_group")
			playerScene.find_node("Sprite").self_modulate = Color(0.44, 0.5, 0.56, 0.5 )
			set_power_active(true)
			power_available = false
			$io_phaseOnAudio.play()

func _on_ActiveTimer_timeout():
	$ActiveTimer.stop()
	get_tree().call_group("phasingMaterial","_add_to_lethal_group")
	playerScene.find_node("Sprite").self_modulate = Color(1,1,1,1)
	$io_phaseOffAudio.play()
	set_power_active(false)
	$CoolDownTimer.start()
	
func broadcast_elapsed_time_percentage() -> void: 
	if !$CoolDownTimer.is_stopped():
		var cooldown_time_left: float = $CoolDownTimer.get_time_left()
		var cooldown_elapsed_time: float = cooldown_time_seconds - cooldown_time_left
		var elapsed_percentage: float = cooldown_elapsed_time / cooldown_time_seconds
		elapsed_percentage = elapsed_percentage * 100
		emit_signal("phase_timer_elapsing", elapsed_percentage)
	elif !$ActiveTimer.is_stopped():
		var active_time_left: float = $ActiveTimer.get_time_left()
		var active_elapsed_time: float = active_time_seconds - active_time_left
		var elapsed_percentage: float = active_elapsed_time / active_time_seconds
		elapsed_percentage = elapsed_percentage * 100
		emit_signal("phase_timer_elapsing", 100 - elapsed_percentage)
			


func _on_CoolDownTimer_timeout():
	$CoolDownTimer.stop()
	power_available = true
	emit_signal("phase_timer_elapsing", 100)
	
	
func set_power_active(new_value: bool) -> void:
	power_active = new_value
	emit_signal("power_triggered", new_value)


func is_power_active() -> bool: 
	return power_active

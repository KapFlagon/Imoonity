extends Node

signal power_triggered(power_active)

var playerScene 
var power_active: bool = false setget set_power_active, is_power_active


# Called when the node enters the scene tree for the first time.
func _ready():
	playerScene = get_parent()
	

func checkActionButtonPressed():
	if PowerManager.is_io_equipped() and Input.is_action_just_pressed("action_phase"):
		if(playerScene.get_collision_mask_bit(2)):
			playerScene.set_collision_mask_bit(2,false)
			playerScene.find_node("Sprite").self_modulate = Color(0.44, 0.5, 0.56, 0.5 )
			set_power_active(true)
		else:
			playerScene.set_collision_mask_bit(2,true)
			playerScene.find_node("Sprite").self_modulate = Color(1,1,1,1)
			set_power_active(false)


func set_power_active(new_value: bool) -> void:
	power_active = new_value
	emit_signal("power_triggered", new_value)


func is_power_active() -> bool: 
	return power_active

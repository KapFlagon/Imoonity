extends Node

var playerScene 

var isCurrentlyPhasing = false

signal phase_ability_on(activated)


# Called when the node enters the scene tree for the first time.
func _ready():
	playerScene = get_parent()
	

func checkActionButtonPressed():
	if Input.is_action_just_pressed("action_phase"):
		if(!isCurrentlyPhasing):
			get_tree().call_group("phasingMaterial","_remove_from_lethal_group")
			playerScene.find_node("Sprite").self_modulate = Color( 0.55, 0, 0, 1 )
			isCurrentlyPhasing = true
			emit_signal("phase_ability_on", true)
		else:
			get_tree().call_group("phasingMaterial","_add_to_lethal_group")
			playerScene.find_node("Sprite").self_modulate = Color(1,1,1,1)
			isCurrentlyPhasing = false
			emit_signal("phase_ability_on", false)
	


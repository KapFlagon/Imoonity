extends Node

var playerScene 


# Called when the node enters the scene tree for the first time.
func _ready():
	playerScene = get_parent()
	

func checkActionButtonPressed():
	if PowerManager.is_io_equipped() and Input.is_action_just_pressed("action_phase"):
		if(playerScene.get_collision_mask_bit(2)):
			playerScene.set_collision_mask_bit(2,false)
			playerScene.find_node("Sprite").self_modulate = Color(0.44, 0.5, 0.56, 0.5 )
		else:
			playerScene.set_collision_mask_bit(2,true)
			playerScene.find_node("Sprite").self_modulate = Color(1,1,1,1)


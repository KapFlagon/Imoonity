extends Node

var playerScene 


# Called when the node enters the scene tree for the first time.
func _ready():
	playerScene = get_parent()


func checkActionButtonPressed():
	if Input.is_action_just_pressed("action_phase"):
		if(playerScene.get_collision_mask_bit(2) ):
			playerScene.set_collision_mask_bit(2,false)
		else:
			playerScene.set_collision_mask_bit(2,true)


extends Node

var playerScene 
var particles 


# Called when the node enters the scene tree for the first time.
func _ready():
	playerScene = get_parent()
	particles =  preload("res://src/scenes/game_objects/phaseAbility/PhasingParticle.tscn").instance()
	playerScene.call_deferred("add_child",particles)
	particles.set_emitting(false)
	


func checkActionButtonPressed():
	if Input.is_action_just_pressed("action_phase"):
		if(playerScene.get_collision_mask_bit(2) ):
			playerScene.set_collision_mask_bit(2,false)
			particles.set_emitting(true)
		else:
			playerScene.set_collision_mask_bit(2,true)
			particles.set_emitting(false)
	


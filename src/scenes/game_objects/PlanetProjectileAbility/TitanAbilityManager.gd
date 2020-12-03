extends Node

export (PackedScene) var TitanProjectile
export (PackedScene) var TitanPlatform

signal current_projectile(count)


var playerScene 
var projectileInstance
var platformArray = []


# Called when the node enters the scene tree for the first time.
func _ready():
	playerScene = get_parent()
	
func _process(delta) -> void:
	if(platformArray.size() > 0):
			var platformToDelete = platformArray[0]
			if(platformToDelete == null):
				platformArray.pop_front()
	broadCastCurrentAmmo()
	
	
func checkActionButtonPressed():
	if PowerManager.is_titan_equipped() and Input.is_action_just_pressed("action_fire"):
		if(platformArray.size() != 3):
			if get_node_or_null("PlanetProjectile") == null:
				fireNewProjectile()
			else:
				spawnPlatform()
	
func fireNewProjectile():
	projectileInstance = TitanProjectile.instance()
	projectileInstance.setprojectileDirection(playerScene.facing)
	add_child(projectileInstance)
	projectileInstance.transform = playerScene.global_transform.translated(Vector2(1,-8))
	$shootTitanAudio.play()

func spawnPlatform():
	var platformInstance = TitanPlatform.instance()
	add_child(platformInstance)
	platformInstance.transform = projectileInstance.global_transform
	projectileInstance.queue_free()
	platformArray.push_back(platformInstance)
	$planetPopUpAudio.play()

			
func broadCastCurrentAmmo():
	match platformArray.size() :
		0:
			emit_signal("current_projectile", 3)
		1:
			emit_signal("current_projectile", 2)
		2:
			emit_signal("current_projectile", 1)
		3:
			emit_signal("current_projectile", 0)
			


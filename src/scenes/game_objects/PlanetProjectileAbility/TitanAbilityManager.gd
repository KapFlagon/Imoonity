extends Node

export (PackedScene) var TitanProjectile
export (PackedScene) var TitanPlatform


var playerScene 
var projectileInstance
var platformArray = []


# Called when the node enters the scene tree for the first time.
func _ready():
	playerScene = get_parent()
	
func checkActionButtonPressed():
	if Input.is_action_just_pressed("action_fire"):
		if get_node_or_null("PlanetProjectile") == null:
			fireNewProjectile()
		else:
			spawnPlatform()
	
func fireNewProjectile():
	projectileInstance = TitanProjectile.instance()
	projectileInstance.setprojectileDirection(playerScene.facing)
	add_child(projectileInstance)
	projectileInstance.transform = playerScene.global_transform.translated(Vector2(1,-8))

func spawnPlatform():
	var platformInstance = TitanPlatform.instance()
	add_child(platformInstance)
	platformInstance.transform = projectileInstance.global_transform
	projectileInstance.queue_free()
	platformArray.push_back(platformInstance)
	if(platformArray.size() > 3):
		platformArray.pop_front().queue_free()
		
		




	


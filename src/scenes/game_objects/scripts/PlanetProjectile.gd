extends Area2D

export var projectileSpeed = 2

export (PackedScene) var PlanetPlatform

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
#	TODO maybe worth discussing if this is the best way to fire projectiles?
	position.x += projectileSpeed
	if Input.is_action_just_pressed("action_fire"):
		spawnPlatform()

func spawnPlatform():
	var platformInstance = PlanetPlatform.instance()
#	Always adding to the parent scene, maybe not needed but can track it from there
	get_tree().get_root().add_child(platformInstance)
	platformInstance.transform = self.global_transform
	queue_free()
	

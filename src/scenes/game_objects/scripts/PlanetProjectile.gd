extends KinematicBody2D

export var projectileSpeed = 5

var velocity = Vector2.ZERO

export (PackedScene) var PlanetPlatform

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	velocity.x += projectileSpeed * get_parent().get_node("Player").last_horizontal_dir
	move_and_slide(velocity, Vector2.UP)
	if Input.is_action_just_pressed("action_fire"):
		spawnPlatform()

func spawnPlatform():
	var platformInstance = PlanetPlatform.instance()
#	Always adding to the parent scene, maybe not needed but can track it from there
	get_parent().add_child(platformInstance)
	platformInstance.transform = self.global_transform
	queue_free()
	

extends KinematicBody2D


export var projectileSpeed = 2
var velocity = Vector2.ZERO


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("travelling")
	pass


func _physics_process(delta):
	velocity.x -= projectileSpeed
	move_and_slide(velocity, Vector2.UP)
	for i in get_slide_count():
		var collisionTile = get_slide_collision(i).collider.name
		if collisionTile != "Launcher" :
			queue_free()
	

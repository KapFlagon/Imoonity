extends KinematicBody2D

export var projectileSpeed = 5


onready var timer = get_node("ProjectileTimer")


var projectileDirection = 0;
var velocity = Vector2.ZERO


func _ready():
	timer.start()


func setprojectileDirection(playerFacing):
	projectileDirection = playerFacing
	
func _physics_process(delta):
	velocity.x += projectileSpeed * projectileDirection
	move_and_slide(velocity, Vector2.UP)
	


func _on_ProjectileTimer_timeout():
	queue_free()

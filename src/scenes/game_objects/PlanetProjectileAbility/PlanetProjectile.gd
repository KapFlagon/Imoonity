extends KinematicBody2D

export var projectileSpeed = 5
var projectileDirection = 0;

var velocity = Vector2.ZERO


func setprojectileDirection(playerFacing):
	projectileDirection = playerFacing
	
func _physics_process(delta):
	velocity.x += projectileSpeed * projectileDirection
	move_and_slide(velocity, Vector2.UP)
	

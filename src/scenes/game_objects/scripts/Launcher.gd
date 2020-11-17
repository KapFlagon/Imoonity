extends StaticBody2D

export (PackedScene) var projectile
var projectileInstance

var timer = 0
# A variable to define how long the timer should last, in seconds.
var timer_wait_time = 2


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func _process(delta):
	timer += delta
	if (timer >= timer_wait_time):
		timer -= timer_wait_time
		fireNewProjectile()
	   


func fireNewProjectile():
	projectileInstance = projectile.instance()
	add_child(projectileInstance)

extends Area2D


var moving = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_HomingObstacle_body_entered(body):
	if body.name == "Player" :
		$HomingObstacleProjectile.set_moving(true)
		get_node("HomingObstacleProjectile/AnimationPlayer").play("moving")
		$HomingAudio.play()


func _on_HomingObstacle_body_exited(body):
	if body.name == "Player" :
		$HomingObstacleProjectile.set_moving(false)
		get_node("HomingObstacleProjectile/AnimationPlayer").stop()
		$HomingAudio.stop()

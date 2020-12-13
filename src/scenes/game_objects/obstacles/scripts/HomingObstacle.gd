extends SwitchableObstacle


onready var _homing_obstacle_projectile = get_node("HomingObstacleProjectile")
onready var _animation_player = get_node("HomingObstacleProjectile/AnimationPlayer")


func _on_Area2D_body_entered(body):
	if body.name == "Player" and is_obstacle_active():
		_start_homing()


func _on_Area2D_body_exited(body):
	if body.name == "Player" and is_obstacle_active():
		_stop_homing()


func flip_active_state() -> void:
	if is_obstacle_active():
		_stop_homing()
	else:
		_start_homing()
	.flip_active_state()


func _start_homing() -> void:
	_homing_obstacle_projectile.set_moving(true)
	_animation_player.play("moving")
	$HomingAudio.play()


func _stop_homing() -> void:
	_homing_obstacle_projectile.set_moving(false)
	_animation_player.stop()
	$HomingAudio.stop()


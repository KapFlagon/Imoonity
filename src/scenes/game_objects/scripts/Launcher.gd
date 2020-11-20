extends StaticBody2D

# Exported variables
export (PackedScene) var projectile
export var firing_interval: int = 1		# A variable to define how long the timer should last, in seconds.


# Non exported variables
var projectile_instance


# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.wait_time = firing_interval


func fireNewProjectile():
	projectile_instance = projectile.instance()
	add_child(projectile_instance)


func _on_Timer_timeout() -> void:
	fireNewProjectile()
	if !$AnimationPlayer.is_playing():
		var animation_time_scaling = calculate_animation_speed_scale(firing_interval)
		$AnimationPlayer.set_speed_scale(animation_time_scaling)
		$AnimationPlayer.play("firing")


# Calculates playback speed for the firing animation based on the firing interval value
func calculate_animation_speed_scale(firing_interval: int) -> float: 
	var output_scale: float = 1
	if firing_interval != 1:
		output_scale = 1.0 / (firing_interval / output_scale)
	return output_scale

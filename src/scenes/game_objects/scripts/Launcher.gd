extends Node2D

enum PossibleFacings {UP, RIGHT, DOWN, LEFT}


# Exported variables
export (PackedScene) var projectile
export var firing_interval: int = 1		# A variable to define how long the timer should last, in seconds.
export(PossibleFacings) var facing


# Non exported variables
var projectile_instance


# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("Timer").wait_time = firing_interval
	rotate_for_facing()
	update_animation_speed()


func fireNewProjectile():
	projectile_instance = projectile.instance()
	add_child(projectile_instance)


func _on_Timer_timeout() -> void:
	fireNewProjectile()
	if get_node("AnimationPlayer").is_playing():
		get_node("AnimationPlayer").stop()
		update_animation_speed()
	get_node("AnimationPlayer").play("firing")
		


# Calculates playback speed for the firing animation based on the firing interval value
func calculate_animation_speed_scale(firing_interval: int) -> float: 
	var output_scale: float = 1
	if firing_interval != 1:
		output_scale = 1.0 / (firing_interval / output_scale)
	return output_scale


func update_animation_speed() -> void: 
	var animation_time_scaling = calculate_animation_speed_scale(firing_interval)
	get_node("AnimationPlayer").set_speed_scale(animation_time_scaling)


func rotate_for_facing() -> void:
	match facing:
		PossibleFacings.UP:
			set_rotation_degrees(0)
		PossibleFacings.RIGHT:
			set_rotation_degrees(90)
		PossibleFacings.DOWN:
			set_rotation_degrees(180)
		PossibleFacings.LEFT:
			set_rotation_degrees(270)



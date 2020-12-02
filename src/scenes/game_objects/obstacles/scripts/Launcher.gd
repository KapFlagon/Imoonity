extends Node2D


# Exported variables
export (PackedScene) var projectile
export var firing_interval: int = 1		# A variable to define how long the timer should last, in seconds.
export(Enums.FIRING_DIRECTIONS) var firing_direction



# Called when the node enters the scene tree for the first time.
func _ready():
	initialise_launcher()


func initialise_launcher() -> void:
	get_node("Timer").wait_time = firing_interval
	rotate_for_facing()
	update_animation_speed()


func fireNewProjectile():
	var projectile_instance = projectile.instance()
	projectile_instance.set_firing_direction(firing_direction)
	add_child(projectile_instance)
	$launcherAudio.play()


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
	match firing_direction:
		Enums.FIRING_DIRECTIONS.UP:
			if is_rotation_mismatched(0):
				set_rotation_degrees(0)
		Enums.FIRING_DIRECTIONS.RIGHT:
			if is_rotation_mismatched(90):
				set_rotation_degrees(90)
		Enums.FIRING_DIRECTIONS.DOWN:
			if is_rotation_mismatched(180):
				set_rotation_degrees(180)
		Enums.FIRING_DIRECTIONS.LEFT:
			if is_rotation_mismatched(270):
				set_rotation_degrees(270)


func is_rotation_mismatched(target_rotation: float) -> bool:
	var update_rotation: bool = false
	if get_rotation_degrees() == target_rotation:
		update_rotation = false
	else:
		update_rotation = true
	return update_rotation


func _on_VisibilityEnabler2D_screen_entered() -> void:
	get_node("Timer").start()


func _on_VisibilityEnabler2D_screen_exited() -> void:
	get_node("Timer").stop()


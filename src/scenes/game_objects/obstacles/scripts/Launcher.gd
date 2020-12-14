tool
extends SwitchableObstacle


# Exported variables
export (PackedScene) var projectile
export var firing_interval: float = 1.0		# A variable to define how long the timer should last, in seconds.
export(Enums.FIRING_DIRECTIONS) var firing_direction


# onready variables for child nodes
onready var _timer = get_node("Timer")
onready var _animation_player = get_node("AnimationPlayer")
onready var _launcer_audio = get_node("launcherAudio")
onready var _visibility_enabler = get_node("VisibilityEnabler2D")


# all other variables
var _projectile_instance


# Called when the node enters the scene tree for the first time.
func _ready():
	_initialise_launcher()


func _process(delta):
	if Engine.editor_hint:
		_rotate_for_facing()


func _initialise_launcher() -> void:
	_timer.wait_time = firing_interval
	_rotate_for_facing()
	_update_animation_speed()


func _fireNewProjectile():
	var b_projectile_instance = projectile.instance()
	b_projectile_instance.set_firing_direction(firing_direction)
	add_child(b_projectile_instance)
	_launcer_audio.play()


func _on_Timer_timeout() -> void:
	_fireNewProjectile()
	if _animation_player.is_playing():
		_animation_player.stop()
		_update_animation_speed()
	_animation_player.play("firing")


# Calculates playback speed for the firing animation based on the firing interval value
func _calculate_animation_speed_scale(firing_interval: float) -> float: 
	var output_scale: float = 1
	if firing_interval != 1:
		output_scale = 1.0 / (firing_interval / output_scale)
	return output_scale


func _update_animation_speed() -> void: 
	var animation_time_scaling = _calculate_animation_speed_scale(firing_interval)
	_animation_player.set_speed_scale(animation_time_scaling)


func _rotate_for_facing() -> void:
	match firing_direction:
		Enums.FIRING_DIRECTIONS.UP:
			if _is_rotation_mismatched(0):
				set_rotation_degrees(0)
		Enums.FIRING_DIRECTIONS.RIGHT:
			if _is_rotation_mismatched(90):
				set_rotation_degrees(90)
		Enums.FIRING_DIRECTIONS.DOWN:
			if _is_rotation_mismatched(180):
				set_rotation_degrees(180)
		Enums.FIRING_DIRECTIONS.LEFT:
			if _is_rotation_mismatched(270):
				set_rotation_degrees(270)


func _is_rotation_mismatched(target_rotation: float) -> bool:
	var update_rotation: bool = false
	if get_rotation_degrees() == target_rotation:
		update_rotation = false
	else:
		update_rotation = true
	return update_rotation


func _on_VisibilityEnabler2D_screen_entered() -> void:
	_timer.start()


func _on_VisibilityEnabler2D_screen_exited() -> void:
	_timer.stop()


func flip_active_state(): 
	if is_obstacle_active():
		_timer.stop()
		_animation_player.stop()
	else: 
		_timer.start()
	.flip_active_state()


extends Node


signal puck_timer_elapsing(percentage_elapsed)


export (int) var dash_force = 2000
export (float) var cooldown_time_seconds = 1


var player_scene = null
var dash_available: bool = true
var action_button: String setget set_action_button, get_action_button


func _ready() -> void:
	action_button = "power_1"
	player_scene = get_parent()
	$Timer.set_wait_time(cooldown_time_seconds)


func _process(delta) -> void:
	broadcast_elapsed_time_percentage()


func set_action_button(new_action_button: String):
	action_button = new_action_button


func get_action_button() -> String:
	return action_button


func checkActionButtonPressed():
	if PowerManager.is_puck_equipped() and Input.is_action_just_pressed(action_button) and dash_available:
		launch_dash(player_scene.velocity)
		#$PlayerSFX/DashAudio.play()
		#get_node("../").$PlayerSFX/DashAudio.play()
		#get_node("../../").$PlayerSFX/DashAudio.play()
		dash_available = false
		$Timer.start()


func launch_dash(current_velocity: Vector2) -> void: 
	var new_horizontal_velocity = current_velocity.x
	var output_vector2 = Vector2.ZERO
	if player_scene.facing == 1:
		new_horizontal_velocity = current_velocity.x + dash_force
	elif player_scene.facing == -1:
		new_horizontal_velocity = current_velocity.x - dash_force
	output_vector2.x = new_horizontal_velocity
	output_vector2.y = current_velocity.y
	player_scene.move_and_slide(output_vector2, Vector2.UP)


func _on_Timer_timeout() -> void:
	$Timer.stop()
	dash_available = true
	emit_signal("puck_timer_elapsing", 100)


func broadcast_elapsed_time_percentage() -> void: 
	if !$Timer.is_stopped():
		var cooldown_time_left: float = $Timer.get_time_left()
		var cooldown_elapsed_time: float = cooldown_time_seconds - cooldown_time_left
		var elapsed_percentage: float = cooldown_elapsed_time / cooldown_time_seconds
		elapsed_percentage = elapsed_percentage * 100
		emit_signal("puck_timer_elapsing", elapsed_percentage)


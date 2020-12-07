extends Node2D


var camera_center


func _ready() -> void:
	play_fade_in()


func _process(delta: float) -> void:
	if get_node("TransitionAnimPlayer").is_playing():
		update_position()


func play_fade_in() -> void:
	get_node("TransitionAnimPlayer").play("fade_in")
	yield(get_node("TransitionAnimPlayer"), "animation_finished")


func play_fade_out() -> void:
	get_node("TransitionAnimPlayer").play("fade_out") 
	yield(get_node("TransitionAnimPlayer"), "animation_finished")
	ScreenManager.next_screen()


func update_position() -> void: 
	camera_center = get_parent().get_node("Player").get_node("Camera2D").get_camera_screen_center()
	var new_position = Vector2.ZERO
	new_position.x = camera_center.x - 250
	new_position.y = camera_center.y - 150
	set_global_position(new_position)


extends Node2D


var camera_center


func _ready() -> void:
	play_fade_in()
	pass


func play_fade_in() -> void:
	update_position()
	get_node("TransitionAnimPlayer").play("fade_in")


func play_fade_out() -> void:
	update_position()
	get_node("TransitionAnimPlayer").play("fade_out") 
	yield(get_node("TransitionAnimPlayer"), "animation_finished")
	ScreenManager.level_ended()


func update_position() -> void: 
	camera_center = get_parent().get_node("Player").get_node("Camera2D").get_camera_screen_center()
	var new_position = Vector2.ZERO
	new_position.x = camera_center.x - 250
	new_position.y = camera_center.y - 150
	set_global_position(new_position)


#func _on_LevelExit_level_ended() -> void:
#	fade_out()

extends Popup


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func update_display_location(camera_center: Vector2) -> void:
	var width = rect_size.x * rect_scale.x
	var height = rect_size.y * rect_scale.y
	var x = camera_center.x - (width / 2)
	var y = camera_center.y - (height / 2) 
	var new_position = Vector2(x, y)
	rect_position = new_position
	
func pause_game() -> void:
	get_tree().paused = true
	
func un_pause_game() -> void:
	get_tree().paused = false
	
	


func _on_resetLevel_button_up():
	pass # Replace with function body.


func _on_mainMenu_button_up():
	ScreenManager.next_screen(Enums.SCREENS.INTRO)
	
func _on_cancel_button_up():
	un_pause_game()


func _on_pauseMenu_about_to_show():
	pause_game()

func _on_pauseMenu_popup_hide():
	un_pause_game()




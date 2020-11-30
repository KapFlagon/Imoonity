extends CanvasLayer


func _ready() -> void:
	initialize_hud()


func update_puck_dash_progress(progress_value: float) -> void:
	$TopHBoxContainer/PowersHBoxContainer/PuckDash.set_value(progress_value)


func initialize_hud() -> void:
	update_puck_dash_progress(100)


func _on_Puck_Dash_puck_timer_elapsing(percentage_elapsed) -> void:
	update_puck_dash_progress(percentage_elapsed)


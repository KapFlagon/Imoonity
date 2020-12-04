extends Node2D


# Custom Signals
signal level_ended


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	connect("level_ended", get_parent().get_node("Transitions"), "play_fade_out")
	pass # Replace with function body.


func _on_AnimationSensor_area_entered(area: Area2D) -> void:
	if area.get_parent().name == "Player":
		$LevelExitSprite.play("open")


func _on_AnimationSensor_area_exited(area: Area2D) -> void:
	if area.get_parent().name == "Player":
		$LevelExitSprite.play("close")


func _on_LevelExitSensor_area_entered(area: Area2D) -> void:
	if area.get_parent().name == "Player":
		ScreenManager.set_player_start_coordinates(Vector2.ZERO)
		emit_signal("level_ended")


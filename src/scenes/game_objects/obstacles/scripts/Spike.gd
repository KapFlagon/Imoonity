extends Area2D



func _on_VisibilityEnabler2D_screen_entered() -> void:
	$AnimationPlayer.play("flash")


func _on_VisibilityEnabler2D_screen_exited() -> void:
	$AnimationPlayer.stop()

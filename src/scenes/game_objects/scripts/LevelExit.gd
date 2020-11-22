extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.




func _on_Area2D_area_exited(area: Area2D) -> void:
	print("area parent:" + str(area.get_parent().get_name()))
	if area.get_parent().name == "Player":
		$LevelExitSprite.play("open")
		print("here")
		pass # Replace with function body.

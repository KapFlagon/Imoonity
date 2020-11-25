extends Area2D

enum Positions {UP, RIGHT, DOWN, LEFT,}

export(Positions) var closedPosition
export(Positions) var openedPosition

func closeBridge() -> void:
	rotateBridge(closedPosition)

func openBridge() -> void:
	rotateBridge(openedPosition)

func rotateBridge(newPosition: int) -> void:
	match newPosition: 
		Positions.UP: 
			if isValidRotation(0):
				set_rotation_degrees(0)
		Positions.RIGHT: 
			if isValidRotation(90):
				$AnimationPlayer.play("UP-to-RIGHT")
				#set_rotation_degrees(90)
		Positions.DOWN: 
			if isValidRotation(180):
				$AnimationPlayer.play("RIGHT-to-DOWN")
				#set_rotation_degrees(180)
		Positions.LEFT: 
			if isValidRotation(270):
				set_rotation_degrees(270)

func isValidRotation(newRotation: int) -> bool:
	var validRotation = false
	if get_rotation_degrees() != newRotation:
		validRotation = true
	return validRotation


func _on_BridgeButton_pressed():
	rotateBridge(Positions.RIGHT)
	print("Hello")


extends Area2D

enum Positions {UP, RIGHT, DOWN, LEFT,}

export(Positions) var closedPosition
export(Positions) var openedPosition
var animPlayer
var rotateBridgeAnim

func _ready():
	buildDynamicAnimationPlayer()
	#buildDynamicAnimationPlayer(0,90)

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
				animPlayer.play("rotateBridgeAnim")
				#$AnimationPlayer.play("UP-to-RIGHT")
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
	#print("Hello")

#func buildDynamicAnimationPlayer(degreesStart, degreesEnd) -> void:
func buildDynamicAnimationPlayer() -> void:
	animPlayer = AnimationPlayer.new()
	add_child(animPlayer)
	rotateBridgeAnim = Animation.new()
	animPlayer.add_animation( "rotateBridgeAnim", rotateBridgeAnim)
	rotateBridgeAnim.add_track(0)
	rotateBridgeAnim.length = 3
	var path = String(self.get_path())
	path = path + ":rotation_degrees"
	#print(path)
	rotateBridgeAnim.track_set_path(0, path)
	rotateBridgeAnim.track_insert_key(0, 0.0, 0)
	rotateBridgeAnim.track_insert_key(0, 3, 90)
	#rotateBridgeAnim.track_insert_key(0, 0.0, degreesStart)
	#rotateBridgeAnim.track_insert_key(0, 3, degreesEnd)

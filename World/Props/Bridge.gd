extends Area2D

enum Positions {UP, RIGHT, DOWN, LEFT,}

export(Positions) var closedPosition
export(Positions) var openedPosition
export var isOpen = true
var animPlayer
var animation_open
var animation_close

func _ready():
	var openedDegrees = position_to_degrees(openedPosition)
	var closedDegrees = position_to_degrees(closedPosition)
	buildDynamicAnimationPlayer(closedDegrees,openedDegrees)
	set_initial_position()

func rotateBridge() -> void:
	if isOpen:
		animPlayer.play("close")
		isOpen = false
	elif !isOpen:
		animPlayer.play("open")
		isOpen = true

func isValidRotation(newRotation: int) -> bool:
	var validRotation = false
	if get_rotation_degrees() != newRotation:
		validRotation = true
	return validRotation

func _on_BridgeButton_pressed():
	if !animPlayer.is_playing():
		rotateBridge()

func _on_BridgeButton2_pressed():
	if !animPlayer.is_playing():
		rotateBridge()

func buildDynamicAnimationPlayer(degreesClose, degreesOpen) -> void:
	animPlayer = AnimationPlayer.new()
	add_child(animPlayer)
	animation_open = Animation.new()
	animation_close = Animation.new()
	buildAnimationTrack("open", degreesClose, degreesOpen, animation_open)
	buildAnimationTrack("close", degreesOpen, degreesClose, animation_close)

func buildAnimationTrack(animTitle, startKey, endKey, animation_object) -> void:
	animPlayer.add_animation( animTitle, animation_object)
	var trackCount = animation_object.get_track_count()
	animation_object.add_track(trackCount)
	animation_object.length = 3
	var path = String(self.get_path())
	path = path + ":rotation_degrees"
	animation_object.track_set_path(trackCount, path)
	animation_object.track_insert_key(trackCount, 0.0, startKey)
	animation_object.track_insert_key(trackCount, 3, endKey)

func position_to_degrees(newPosition: int) -> int:
	var degreeOutput
	match newPosition: 
		Positions.UP: 
			if isValidRotation(0):
				degreeOutput = 0
		Positions.RIGHT: 
			if isValidRotation(90):
				degreeOutput = 90
		Positions.DOWN: 
			if isValidRotation(180):
				degreeOutput = 180
		Positions.LEFT: 
			if isValidRotation(270):
				degreeOutput = 270
	return degreeOutput

func set_initial_position() -> void:
	var rotation
	if isOpen:
		rotation = position_to_degrees(openedPosition)
	else:
		rotation = position_to_degrees(closedPosition)
	set_rotation_degrees(rotation)


tool
extends Area2D

enum Positions {UP, RIGHT, DOWN, LEFT,}

export(Positions) var closedPosition = Positions.UP setget set_closedPosition
export(Positions) var openedPosition = Positions.UP setget set_openedPosition
export var _bridge_open = true setget set_bridge_open, is_bridge_open

var _anim_player
var _animation_open
var _animation_close


func _ready():
	var openedDegrees = position_to_degrees(openedPosition)
	var closedDegrees = position_to_degrees(closedPosition)
	buildDynamicAnimationPlayer(closedDegrees,openedDegrees)
	set_initial_position()


func _process(delta):
	if Engine.editor_hint:
		set_initial_position()


func rotateBridge() -> void:
	if not _anim_player.is_playing():
		if is_bridge_open():
			_anim_player.play("close")
			set_bridge_open(false)
		elif not is_bridge_open():
			_anim_player.play("open")
			set_bridge_open(true)


func buildDynamicAnimationPlayer(degreesClose, degreesOpen) -> void:
	_anim_player = AnimationPlayer.new()
	add_child(_anim_player)
	_animation_open = Animation.new()
	_animation_close = Animation.new()
	buildAnimationTrack("open", degreesClose, degreesOpen, _animation_open)
	buildAnimationTrack("close", degreesOpen, degreesClose, _animation_close)

func buildAnimationTrack(animTitle, startKey, endKey, animation_object) -> void:
	_anim_player.add_animation( animTitle, animation_object)
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
			degreeOutput = 0
		Positions.RIGHT: 
			degreeOutput = 90
		Positions.DOWN: 
			degreeOutput = 180
		Positions.LEFT: 
			degreeOutput = 270
		_:
			degreeOutput = 0
	return degreeOutput


func set_initial_position() -> void:
	var rotation
	if is_bridge_open():
		rotation = position_to_degrees(openedPosition)
	else:
		rotation = position_to_degrees(closedPosition)
	set_rotation_degrees(rotation)


func set_closedPosition(new_value) -> void:
	closedPosition = new_value


func set_openedPosition(new_value) -> void:
	openedPosition = new_value


func set_bridge_open(new_value: bool) -> void:
	_bridge_open = new_value


func is_bridge_open() -> bool:
	return _bridge_open


func is_bridge_rotating() -> bool:
	if _anim_player.is_playing():
		return true
	else: 
		return false

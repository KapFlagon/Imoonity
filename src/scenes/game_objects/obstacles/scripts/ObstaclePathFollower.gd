extends SwitchableObstacle


class_name ObstaclePathFollower


onready var _sprite = get_node("Sprite")
onready var _animation_player = get_node("AnimationPlayer")
onready var _audio = get_node("PathFollowAudio")


var _speed: int setget set_speed, get_speed 
var _path_follow: PathFollow2D setget set_path_follow, get_path_follow


func _ready():
	_sprite.self_modulate = Color( 0, 1, 0, 1 )
	_animation_player.play("moving")
	_audio.play()


func _process(delta):
	if is_obstacle_active():
		_path_follow.set_offset(_path_follow.get_offset() + _speed * delta)


func _update_visuals() -> void:
	if not is_obstacle_active():
		_animation_player.play("moving")
		_audio.play()
	else:
		_animation_player.stop()
		_audio.stop()


func set_speed(new_value: int) -> void:
	_speed = new_value


func get_speed() -> int: 
	return _speed


func set_path_follow(new_value: PathFollow2D) -> void:
	_path_follow = new_value


func get_path_follow() -> PathFollow2D:
	return _path_follow


func flip_active_state() -> void:
	_update_visuals()
	.flip_active_state()

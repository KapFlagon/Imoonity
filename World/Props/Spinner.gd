extends SwitchableObstacle


export var _speed: int = 1 setget set_speed, get_speed

var _default_speed: int 


func _ready():
	_default_speed = _speed


func _physics_process(delta):
	if is_obstacle_active():
		rotation_degrees = rotation_degrees + _speed


func set_speed(new_value: int) -> void: 
	_speed = new_value


func get_speed() -> int:
	return _speed


func reset_speed() -> void:
	set_speed(_default_speed)


func flip_active_state() -> void:
	.flip_active_state()


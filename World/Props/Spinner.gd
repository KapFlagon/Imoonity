extends SwitchableObstacle


export var _speed: int = 1 setget set_speed, get_speed

var _default_speed: int 
var _visible_by_player: bool = false setget set_visible_by_player, is_visible_by_player


func _ready():
	_default_speed = _speed


func _physics_process(delta):
	if is_obstacle_active() and is_visible_by_player():
		rotation_degrees = rotation_degrees + _speed


func set_speed(new_value: int) -> void: 
	_speed = new_value


func get_speed() -> int:
	return _speed


func reset_speed() -> void:
	set_speed(_default_speed)


func flip_active_state() -> void:
	.flip_active_state()


func set_visible_by_player(new_value: bool) -> void:
	_visible_by_player = new_value


func is_visible_by_player() -> bool:
	return _visible_by_player


func _on_VisibilityEnabler2D_screen_entered():
	set_visible_by_player(true)


func _on_VisibilityEnabler2D_screen_exited():
	set_visible_by_player(false)

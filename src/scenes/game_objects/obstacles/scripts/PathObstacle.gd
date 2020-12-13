extends SwitchableObstacle

var _default_speed: int setget , get_default_speed


export var movement_speed: int = 100 setget set_movement_speed, get_movement_speed


onready var path_follow_2d: PathFollow2D = get_node("PathFollow2D")
onready var obstacle_path_follower: Node2D = get_node("PathFollow2D/ObstaclePathFollower") setget , get_path_follower


func _ready():
	_default_speed = get_movement_speed()
	obstacle_path_follower.set_speed(movement_speed)
	obstacle_path_follower.set_path_follow(path_follow_2d)


func set_movement_speed(new_value: int) -> void:
	movement_speed = new_value
	obstacle_path_follower.set_speed(movement_speed)


func get_movement_speed() -> int:
	return movement_speed


func get_path_follower() -> Node2D: 
	return obstacle_path_follower


func get_default_speed() -> int:
	return _default_speed


func reset_speed() -> void:
	set_movement_speed(_default_speed)


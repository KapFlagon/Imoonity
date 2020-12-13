extends KinematicBody2D

export var projectileSpeed = 50

var moving setget set_moving, is_moving
var velocity = Vector2.ZERO


func _ready():
	moving = false
	get_node("HomingSprite").self_modulate = Color( 1, 0.65, 0, 1 ) 


func _physics_process(delta):
	velocity = Vector2.ZERO
	if moving :
		var player = get_node("../../../Player")
		velocity = global_position.direction_to(player.global_position) * projectileSpeed
		move_and_slide(velocity)
		
		
func set_moving(new_moving: bool) -> void: 
	moving = new_moving


func is_moving() -> bool:
	return moving


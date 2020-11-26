extends KinematicBody2D

export var projectileSpeed = 50

var moving setget set_moving, get_moving
var velocity = Vector2.ZERO



# Called when the node enters the scene tree for the first time.
func _ready():
	moving = false
	$HomingSprite.self_modulate = Color( 1, 0.65, 0, 1 ) 


func _physics_process(delta):
	velocity = Vector2.ZERO
	if moving :
		var player = get_tree().get_root().get_node("TemplateLevel/Player")
		velocity = global_position.direction_to(player.global_position) * projectileSpeed
		move_and_slide(velocity)
		
		
func set_moving(new_moving: bool) -> void: 
	moving = new_moving


func get_moving() -> bool:
	return moving

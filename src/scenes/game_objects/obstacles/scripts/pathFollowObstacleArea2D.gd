extends Area2D


onready var path_follow = get_parent()
onready var speed = get_parent().get_parent().movement_speed


# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite.self_modulate = Color( 0, 1, 0, 1 )
	$AnimationPlayer.play("moving")



func _process(delta):
	path_follow.set_offset(path_follow.get_offset() + speed * delta)

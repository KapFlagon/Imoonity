extends KinematicBody2D # This is the original
#extends RigidBody2D # Testing rigidbody

class_name Box

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func push(velocity: Vector2) -> void:
	print("Push was not implemented in %s", filename)
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

extends StaticBody2D


export var speed: int = 1	  # A variable to define how fast the spinner spins


func _physics_process(delta):
	rotation_degrees = rotation_degrees + speed

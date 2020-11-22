extends Area2D


enum PossibleFacings {UP, RIGHT, DOWN, LEFT}


export(PossibleFacings) var facing


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	rotate_for_facing()


func rotate_for_facing() -> void:
	match facing:
		PossibleFacings.UP:
			set_rotation_degrees(0)
		PossibleFacings.RIGHT:
			set_rotation_degrees(90)
		PossibleFacings.DOWN:
			set_rotation_degrees(180)
		PossibleFacings.LEFT:
			set_rotation_degrees(270)


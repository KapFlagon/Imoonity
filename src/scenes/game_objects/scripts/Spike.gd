extends Area2D


enum PossibleOrientations {UP, RIGHT, DOWN, LEFT}


export(PossibleOrientations) var orientation



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	rotate_for_orientation()


func rotate_for_orientation() -> void:
	match orientation:
		PossibleOrientations.UP:
			set_rotation_degrees(0)
		PossibleOrientations.RIGHT:
			set_rotation_degrees(90)
		PossibleOrientations.DOWN:
			set_rotation_degrees(180)
		PossibleOrientations.LEFT:
			set_rotation_degrees(270)


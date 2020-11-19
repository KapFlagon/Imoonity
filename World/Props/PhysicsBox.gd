extends Box
class_name PhysicsBox
export var gravity: int = 200
var motion = Vector2()

func _physics_process(delta):
	motion.y = 30*delta
	translate(motion)

func push(velocity: Vector2) -> void:
	move_and_slide(velocity, Vector2())

#func update_object_vertical_velocity(delta: float, current_vertical_velocity: float) -> float: 
#	# TODO Need to redesing the jump and on floor logic, for smoother platforming. 
#	var vertical_velocity = current_vertical_velocity + (delta * gravity)
#	if is_on_floor():
#		pass
#	else:
#		vertical_velocity = current_vertical_velocity + (jump_force/2)
#	return vertical_velocity
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

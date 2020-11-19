extends Box

class_name PhysicsBox
export var gravity: int = 2000 # Reduced this from 200 just to test
var motion = Vector2()

func _physics_process(delta):
	apply_gravity(delta)
	#motion.y = gravity*delta
	
	
	#translate(motion)

func push(velocity: Vector2) -> void:
	move_and_slide(velocity, Vector2())

func apply_gravity(delta) -> void:
	motion.y = gravity*delta
	var grav = Vector2(0,motion.y)
	move_and_slide(grav, Vector2.UP)
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

extends Box

class_name PhysicsBox
export var gravity: int = 2000 # Reduced this from 200 just to test
var motion = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	apply_gravity(delta)
	#motion.y = gravity*delta

func push(velocity: Vector2) -> void:
	move_and_slide(velocity, Vector2())

func apply_gravity(delta) -> void:
	motion.y = gravity*delta
	var grav = Vector2(0,motion.y)
	move_and_slide(grav, Vector2.UP)

# Testing pressing of button
func _on_Button_pressed():
	move_and_slide(Vector2(1000,5))


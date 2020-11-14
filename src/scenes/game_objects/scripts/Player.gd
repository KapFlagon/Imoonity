extends KinematicBody2D

# Exported variables
export var facing: int = 1
export var gravity: int = 200
export var ground_friction: int = 0.25
export var air_friction: int = 0.02
export var base_movement_speed: int = 300
export var max_movement_speed: int = 100
export var jump_force: int = 150

# Additional variables
var velocity: Vector2 = Vector2(0, 0)



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	update_player_velocity(delta)
	
	move_and_slide(velocity, Vector2.UP)


func update_player_velocity(delta: float) -> void:
	velocity.x = update_player_horizontal_velocity()
	velocity.y = update_player_vertical_velocity(delta, velocity.y) 


func update_player_horizontal_velocity() -> float:
	var horizontal_velocity
	var horizontal_input = get_horizontal_input()
	if horizontal_input != 0:
		horizontal_velocity = horizontal_input * base_movement_speed 
		horizontal_velocity = clamp(horizontal_velocity, -max_movement_speed, max_movement_speed)
		update_facing(horizontal_input)
	else:
		horizontal_velocity = 0
	return horizontal_velocity


func get_horizontal_input() -> float:
	return Input.get_action_strength("move_right") - Input.get_action_strength("move_left")


func update_facing(horizontal_input: float) -> void:
	var direction_strength = horizontal_input
	if direction_strength > 0:
		# Only flips the sprite if the direction is new, accounts for starting positions
		if facing != 1:
			$Sprite.flip_h = false
		facing = 1		
	elif direction_strength < 0:
		if facing != -1:
			# Only flips the sprite if the direction is new, accounts for starting positions
			$Sprite.flip_h = true
		facing = -1


func update_player_vertical_velocity(delta: float, current_vertical_velocity: float) -> float: 
	# TODO Need to redesing the jump and on floor logic, for smoother platforming. 
	var vertical_velocity = current_vertical_velocity + (delta * gravity)
	if is_on_floor():
		if Input.is_action_pressed("move_jump"):
			vertical_velocity = current_vertical_velocity - jump_force
		else: 
			vertical_velocity = lerp(current_vertical_velocity, 0, ground_friction)
	else:
		if Input.is_action_just_released("move_jump") and current_vertical_velocity < (-jump_force/2):
			vertical_velocity = current_vertical_velocity + (jump_force/2)
	return vertical_velocity

extends KinematicBody2D

# Exported variables
export var facing: int = 1
export var gravity: int = 200
export var ground_friction: int = 0.25
export var air_friction: int = 0.02
export var base_movement_speed: int = 300
export var max_movement_speed: int = 100
export var jump_force: int = 100
export var push_speed : = 1
export var respawnTime : = 1.0

# Additional variables
var velocity: Vector2 = Vector2(0, 0)
var current_state: int = Enums.PLAYER_STATE.IDLE
var can_pick = true
var spawn_location: Vector2 =  Vector2(30,170)
var movementEnabled = true
#var spawn_location: Vector2 =  Vector2(230,60)  # For testing


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position = spawn_location
	update_animations(current_state)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if(movementEnabled):
		update_player_velocity(delta)
		
	# warning-ignore:return_value_discarded
		move_and_slide(velocity, Vector2.UP)
		
	#	Place Holder for now
		$Puck_Dash.checkActionButtonPressed()
		$TitanAbilityManager.checkActionButtonPressed()
		$phaseAbilityManager.checkActionButtonPressed()

		# Check if phobos power button pressed
		if Input.is_action_pressed("grab_object"): 
			# Check if player is colliding with object
			if get_slide_count() > 0:
				check_box_collision(velocity)
	

func update_player_velocity(delta: float) -> void:
	var old_y = velocity.y
	velocity.x = update_player_horizontal_velocity()
	velocity.y = update_player_vertical_velocity(delta, velocity.y) 
	update_state(velocity.x, old_y, velocity.y)
	update_animations(current_state)


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

func check_box_collision(velocity : Vector2) -> void:
	var box : = get_slide_collision(0).collider as Box
	if box:
		box.push(push_speed * velocity)

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
		if Input.is_action_just_pressed("move_jump"):
			vertical_velocity = -jump_force
		else: 
			vertical_velocity = lerp(current_vertical_velocity, 0, ground_friction)
	else:
		if Input.is_action_just_released("move_jump") and current_vertical_velocity < (-jump_force/2):
			vertical_velocity = current_vertical_velocity + (jump_force/2)
	return vertical_velocity


func update_state(velocity_x: float, old_y: float, new_y: float) -> void: 
#	print("old_x: " + str(old_x) + " new_y: " + str(new_x) + " old_y: " + str(old_y) + " new_y: " + str(new_y))
	var temp_y = old_y - (new_y * -1)
	if is_on_floor() and velocity_x == 0:
		current_state = Enums.PLAYER_STATE.IDLE
	elif is_on_floor() and velocity_x != 0:
		current_state = Enums.PLAYER_STATE.RUNNING
	elif !is_on_floor() and temp_y < 0: 
		current_state = Enums.PLAYER_STATE.JUMPING
	elif !is_on_floor() and temp_y > 0:
		current_state = Enums.PLAYER_STATE.FALLING


func update_animations(new_state: int) -> void:
	match new_state: 
		Enums.PLAYER_STATE.IDLE:
			$AnimationPlayer.play("idle")
		Enums.PLAYER_STATE.RUNNING:
			$AnimationPlayer.play("running")
		Enums.PLAYER_STATE.JUMPING:
			$AnimationPlayer.play("jumping")
		Enums.PLAYER_STATE.FALLING: 
			$AnimationPlayer.play("falling")
		Enums.PLAYER_STATE.LANDING: 
			$AnimationPlayer.play("landing")


func _on_DeathDetector_area_entered(area: Area2D) -> void:
	if area.is_in_group("lethal"):
		_respawn_player()
	elif area.is_in_group("checkpoint"):
		spawn_location = area.get_position()
		
func _respawn_player():
	$DeathAnimation.global_transform = global_transform.translated(Vector2(1,-6))
	$DeathAnimation.emitting = true
	$DeathAnimation/DeathAudio.play()
	$Sprite.visible=false
	movementEnabled = false
	yield(get_tree().create_timer(respawnTime), "timeout")
	self.position = spawn_location
	$Sprite.visible=true
	movementEnabled = true
	$DeathAnimation/DeathAudio.stop()


extends RigidBody2D

var picked = false
var oldspeed

func _ready():
	oldspeed = get_node("../Player").base_movement_speed

func _physics_process(delta):
	if picked == true:
		#self.position = get_node("../Player/Position2D").global_position
		self.position = get_node("../Player/Position2D").global_position
		get_node("../Player").base_movement_speed = oldspeed/6
		sleeping = true
	else:
		sleeping = false
		get_node("../Player").base_movement_speed = oldspeed

func _input(event):
	if Input.is_action_just_pressed("pickup"):
		#print("Hello")
		var bodies = $Detector.get_overlapping_bodies()
		for b in bodies:
			#if b.name == "Player" and get_node("../Player").can_pick == true:
			if b.name == "Player":
				picked = true
				#get_node("../Player").can_pick = false
	if Input.is_action_just_pressed("drop") and picked == true:
		#print("drop")
		picked = false
		#get_node("../Player").can_pick = true
	if Input.is_action_just_pressed("throw") and picked == true:
		#print("throw")
		picked = false
		#get_node("../Player").can_pick = true
		#apply_impulse(Vector2(), Vector2(200, -50))
		if get_node("../Player/Sprite").flip_h == false:
			apply_impulse(Vector2(), Vector2(200, -50))
		else:
			apply_impulse(Vector2(), Vector2(-200, -50))

extends KinematicBody2D

# Exported variables
export var projectileSpeed = 2


# Other variables
var velocity = Vector2.ZERO
var firing_direction setget set_firing_direction, get_firing_direction
var _out_of_bounds: bool = false setget set_out_of_bounds, is_out_of_bounds


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("travelling")


func _physics_process(delta):
	if not is_out_of_bounds():
		velocity = update_projectile_velocity(velocity)
		move_and_slide(velocity, Vector2.UP)
		for i in get_slide_count():
			var collisionTile = get_slide_collision(i).collider.name
			if collisionTile != "Launcher":
				queue_free()
	else: 
		queue_free()


# Calculate the velocity based on intended direction of the projectile.
func update_projectile_velocity(current_velocity: Vector2) -> Vector2:
	var projectile_velocity: Vector2 = current_velocity
	match firing_direction:
		Enums.FIRING_DIRECTIONS.UP:
			projectile_velocity.y -= projectileSpeed
		Enums.FIRING_DIRECTIONS.RIGHT:
			projectile_velocity.x += projectileSpeed
		Enums.FIRING_DIRECTIONS.DOWN:
			projectile_velocity.y += projectileSpeed
		Enums.FIRING_DIRECTIONS.LEFT:
			projectile_velocity.x -= projectileSpeed
	return projectile_velocity


func set_firing_direction(new_firing_direction: int) -> void: 
	firing_direction = new_firing_direction


func get_firing_direction() -> int:
	return firing_direction


func set_out_of_bounds(new_value: bool) -> void:
	_out_of_bounds = new_value


func is_out_of_bounds() -> bool:
	return _out_of_bounds


func _on_VisibilityNotifier2D_screen_exited():
	set_out_of_bounds(true)

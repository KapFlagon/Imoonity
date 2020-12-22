extends Area2D


onready var _animated_sprite: AnimatedSprite = get_node("AnimatedSprite")
onready var _button_audio = get_node("buttonAudio")


var _button_just_pressed: bool = false setget set_button_just_pressed, is_button_just_pressed
var _button_down: bool = false setget set_button_down, is_button_down
var _button_up: bool = false setget set_button_up, is_button_up
var _object_count: int = 0


signal button_pressed
signal button_unpressed
signal button_just_pressed


func _ready():
	connect("body_entered", self, "_on_Button_body_entered")
	connect("body_exited", self, "_on_Button_body_exited")


func _process(delta):
	_emit_continual_pressed_signal()


func set_button_just_pressed(new_value: bool) -> void:
	_button_just_pressed = new_value


func is_button_just_pressed() -> bool:
	return _button_just_pressed


func set_button_down(new_value: bool) -> void:
	_button_down = new_value


func is_button_down() -> bool: 
	return _button_down


func set_button_up(new_value: bool) -> void:
	_button_up = new_value


func is_button_up() -> bool:
	return _button_up


func _on_Button_body_entered(body):
	_object_count += 1
	if _object_count <= 1 and _valid_for_collision(body):
		if not is_button_just_pressed():
			emit_signal("button_just_pressed")
			set_button_just_pressed(true)
		_button_audio.play()
		_animated_sprite.play("On")
		set_button_down(true)


func _on_Button_body_exited(body):
	_object_count -= 1
	if _object_count < 1 and _valid_for_collision(body):
		_animated_sprite.play("Off")
		emit_signal("button_unpressed")
		set_button_just_pressed(false)
		set_button_down(false)


func _emit_continual_pressed_signal() -> void:
	if is_button_down():
		emit_signal("button_pressed")


func _valid_for_collision(body: PhysicsBody2D) -> bool:
	var valid_collision = false
	if body.name != "HomingObstacle" and body.name != "HomingObstacleProjectile" and !body.is_in_group("lethal"):
		valid_collision = true
	return valid_collision

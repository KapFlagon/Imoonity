extends Area2D

onready var animated_sprite : AnimatedSprite = $AnimatedSprite

signal pressed
signal unpressed

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	connect("body_entered", self, "_on_body_entered")
	connect("body_exited", self, "_on_body_exited")
	
func _on_body_entered(body: PhysicsBody2D) -> void:
	# Check if a body already there
	var bodies = $Detector.get_overlapping_bodies()
	if len(bodies) > 1:
		pass
	else:
		animated_sprite.play("On")
		emit_signal("pressed")
		$buttonAudio.play()

func _on_body_exited(body: PhysicsBody2D) -> void:
	### Is there still a body touching it?
	var bodies = $Detector.get_overlapping_bodies()
	if len(bodies) > 0:
		pass
	else:
		animated_sprite.play("Off")
		emit_signal("unpressed")

extends Area2D

onready var animated_sprite : AnimatedSprite = $AnimatedSprite
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

signal pressed
signal unpressed


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#animated_sprite.play("Off")
	#emit_signal("unpressed")
	connect("body_entered", self, "_on_body_entered")
	connect("body_exited", self, "_on_body_exited")
	
func _on_body_entered(body: PhysicsBody2D) -> void:
	animated_sprite.play("On")
	emit_signal("pressed")

func _on_body_exited(body: PhysicsBody2D) -> void:
	animated_sprite.play("Off")
	emit_signal("unpressed")
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

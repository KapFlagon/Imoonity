extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite.self_modulate = Color( 1, 0, 0, 1 )


func _add_to_lethal_group() -> void:
	add_to_group("lethal")
	
func _remove_from_lethal_group() -> void:
	remove_from_group("lethal")

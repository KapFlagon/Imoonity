extends Node2D


onready var anim_player: AnimationPlayer = get_node("AnimationPlayer")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:

#	if !get_node("AnimationPlayer").is_playing():
##		get_node("AnimationPlayer").play("flash")
#		print("animation started")
#	else:
#		print("animation already playing")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	if !$AnimationPlayer.is_playing():
#		$AnimationPlayer.play("flash")

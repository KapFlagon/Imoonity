extends Node

enum Screens{
	START,
	INTRO_CUTSCENE,
	LEVEL_TEMPLATE,
	END,
}

var current_screen: int
var current_screen_scene = null


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var root = get_tree().get_root()
	current_screen_scene = root.get_child(root.get_child_count() - 1)


func goto_scene(path):
	# This function will usually be called from a signal callback,
	# or some other function in the current scene.
	# Deleting the current scene at this point is
	# a bad idea, because it may still be executing code.
	# This will result in a crash or unexpected behavior.

	# The solution is to defer the load to a later time, when
	# we can be sure that no code from the current scene is running:

	call_deferred("_deferred_goto_scene", path)


func _deferred_goto_scene(path):
	# It is now safe to remove the current scene
	current_screen_scene.free()

	# Load the new scene.
	var s = ResourceLoader.load(path)

	# Instance the new scene.
	current_screen_scene = s.instance()

	# Add it to the active scene, as child of root.
	get_tree().get_root().add_child(current_screen_scene)

	# Optionally, to make it compatible with the SceneTree.change_scene() API.
	get_tree().set_current_scene(current_screen_scene)


func level_ended() -> void: 
	determine_next_screen(current_screen)
	goto_scene("res://src/scenes/levels/prototypes/TemplateLevel.tscn")


func determine_next_screen(current_screen: int) -> void:
	match current_screen:
		Screens.LEVEL_TEMPLATE: 
			current_screen = Screens.LEVEL_TEMPLATE

extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _on_GithubLinkButton_button_up() -> int:
	return OS.shell_open("https://github.com/KapFlagon/GHGO2020")


func _on_PlayButton_button_up() -> void:
	get_tree().change_scene("res://src/scenes/levels/prototypes/TemplateLevel.tscn")

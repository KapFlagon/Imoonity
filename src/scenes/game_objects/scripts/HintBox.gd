tool
extends Node2D


export(String, MULTILINE) var hint_text
#export(bool) var display_arrow = true
#export(Enums.FIRING_DIRECTIONS) var direction
#export(Color, RGBA) var background_colour = Color(0.14, 0.34, 0.27, 1)


func _process(delta: float) -> void:
	update_display_with_export_variables()


func update_display_with_export_variables() -> void:
#	update_background_colour()
	update_hint_label_text()
#	update_arrow_display()


#func update_background_colour() -> void:
#	$ColorRect.color = background_colour


func update_hint_label_text() -> void:
	$HintLabel.set_text(hint_text)


#func update_arrow_display() -> void:
#	if !display_arrow: 
#		$ArrowSprite.hide()
#	else: 
#		$ArrowSprite.show()

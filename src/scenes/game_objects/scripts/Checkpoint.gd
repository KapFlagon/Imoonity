extends Area2D


# Custom Signals
signal powers_updated


# Export variables
export var puck_dash_available: bool = true
export var phobos_strength_available: bool = true
export var io_phasing_available: bool = true
export var titan_platforms_available: bool = true


# Other variables
var player_overlap: bool = false


func _ready() -> void:
	connect("powers_updated", get_parent().get_parent().get_node("Player/Camera2D/PlayerHud"), "update_all_hud_icons")
	$PowerSelectionPopup.set_show_puck_dash(puck_dash_available)
	$PowerSelectionPopup.set_show_io_phase(io_phasing_available)
	$PowerSelectionPopup.set_show_phobos_strength(phobos_strength_available)
	$PowerSelectionPopup.set_show_titan_plat(titan_platforms_available)


func _process(delta: float) -> void:
	_update_prompt()
	check_for_input()


func check_for_input() -> void:
	if player_overlap and Input.is_action_just_released("checkpoint_action"):
		var camera_center = get_parent().get_parent().get_node("Player").get_node("Camera2D").get_camera_screen_center()
		$PowerSelectionPopup.ready_interface(camera_center)


func _on_CheckPoint_body_entered(body: Node) -> void:
	if body.get_name() == "Player":
		player_overlap = true
		ScreenManager.set_player_start_coordinates(get_position())


func _on_CheckPoint_body_exited(body: Node) -> void:
	if body.get_name() == "Player":
		player_overlap = false


func _on_PowerSelectionPopup_popup_hide() -> void:
	emit_signal("powers_updated")


func _update_prompt():
	if player_overlap:
		$PromptContainer.show()
	else:
		$PromptContainer.hide()

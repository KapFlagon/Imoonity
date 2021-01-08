extends CanvasLayer


onready var puck_dash = get_node("TopHBoxContainer/PowersHBoxContainer/PuckDashPanelContainer/VBox/PuckDash")
onready var io_phase = get_node("TopHBoxContainer/PowersHBoxContainer/IoPhasePanelContainer/VBox/IoPhase")
onready var phobos_strength = get_node("TopHBoxContainer/PowersHBoxContainer/PhobosStrengthPanelContainer/VBox/PhobosStrength")
onready var titan_platform = get_node("TopHBoxContainer/PowersHBoxContainer/TitanPlatPanelContainer/VBox/TitanPlat")


func _ready() -> void:
	initialize_hud()
	update_all_hud_icons()
#	update_level_text()


func update_puck_dash_progress(progress_value: float) -> void:
	puck_dash.set_value(progress_value)


func update_phase_progress(progress_value: float) -> void:
	io_phase.set_value(progress_value)


func update_Io_status_icon(power_active: bool) -> void: 
	if power_active:
		io_phase.set_modulate(Color(0.93,15.7,100))
	else: 
		io_phase.set_modulate(Color(0.93,0.4,0.26))


func update_phobos_status_icon(power_active: bool) -> void: 
	if power_active:
		phobos_strength.set_modulate(Color(1,0,0))
	else: 
		phobos_strength.set_modulate(Color(0.34,0.34,0.34))


func update_titan_status_icon(currentAmmo: int) -> void:
	titan_platform.set_value(currentAmmo)


func initialize_hud() -> void:
	update_puck_dash_progress(100)
	update_Io_status_icon(false)
	update_phase_progress(100)
	update_phobos_status_icon(false)


func _on_Puck_Dash_puck_timer_elapsing(percentage_elapsed) -> void:
	update_puck_dash_progress(percentage_elapsed)


func _on_phaseAbilityManager_power_triggered(power_active: bool) -> void:
	update_Io_status_icon(power_active)


func _on_phaseAbilityManager_phase_timer_elapsing(percentage_elapsed):
	update_phase_progress(percentage_elapsed)


func _on_phobosAbilityManager_power_triggered(power_active: bool) -> void:
	update_phobos_status_icon(power_active)

func _on_TitanAbilityManager_current_projectile(count):
	update_titan_status_icon(count)


func update_all_hud_icons() -> void:
	update_PuckDash_HudIcon()
	update_IoPhase_HudIcon()
	update_PhobosStrength_HudIcon()
	update_TitanPlat_HudIcon()


func update_PuckDash_HudIcon() -> void:
	if PowerManager.is_puck_equipped():
		$TopHBoxContainer/PowersHBoxContainer/PuckDashPanelContainer.show()
	else:
		$TopHBoxContainer/PowersHBoxContainer/PuckDashPanelContainer.hide()


func update_IoPhase_HudIcon() -> void:
	if PowerManager.is_io_equipped():
		$TopHBoxContainer/PowersHBoxContainer/IoPhasePanelContainer.show()
	else:
		$TopHBoxContainer/PowersHBoxContainer/IoPhasePanelContainer.hide()


func update_PhobosStrength_HudIcon():
	if PowerManager.is_phobos_equipped():
		$TopHBoxContainer/PowersHBoxContainer/PhobosStrengthPanelContainer.show()
	else:
		$TopHBoxContainer/PowersHBoxContainer/PhobosStrengthPanelContainer.hide()


func update_TitanPlat_HudIcon():
	if PowerManager.is_titan_equipped():
		$TopHBoxContainer/PowersHBoxContainer/TitanPlatPanelContainer.show()
	else:
		$TopHBoxContainer/PowersHBoxContainer/TitanPlatPanelContainer.hide()


func update_level_text(): 
	var level_num = ScreenManager.get_current_screen() - 5
	var level_text = parse_number_to_text(level_num)
	get_node("LevelPanelContainer/LevelHBox/LevelNumLabel").text = level_text


func parse_number_to_text(new_value: int) -> String:
	var text_num = ""
	if new_value < 10:
		text_num = "0" + str(new_value)
	else: 
		text_num = str(new_value)
	return text_num

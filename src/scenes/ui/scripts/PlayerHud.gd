extends CanvasLayer


func _ready() -> void:
	initialize_hud()
	update_all_hud_icons()


func update_puck_dash_progress(progress_value: float) -> void:
	$TopHBoxContainer/PowersHBoxContainer/PuckDash.set_value(progress_value)


func update_phase_progress(progress_value: float) -> void:
	$TopHBoxContainer/PowersHBoxContainer/IoPhase.set_value(progress_value)


func update_Io_status_icon(power_active: bool) -> void: 
	if power_active:
		$TopHBoxContainer/PowersHBoxContainer/IoPhase.set_modulate(Color(0.93,15.7,100))
	else: 
		$TopHBoxContainer/PowersHBoxContainer/IoPhase.set_modulate(Color(0.93,0.4,0.26))


func update_phobos_status_icon(power_active: bool) -> void: 
	if power_active:
		$TopHBoxContainer/PowersHBoxContainer/PhobosStrength.set_modulate(Color(1,0,0))
	else: 
		$TopHBoxContainer/PowersHBoxContainer/PhobosStrength.set_modulate(Color(0.34,0.34,0.34))


func update_titan_status_icon(currentAmmo: int) -> void:
	$TopHBoxContainer/PowersHBoxContainer/TitanPlat.set_value(currentAmmo)


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
		$TopHBoxContainer/PowersHBoxContainer/PuckDash.show()
	else:
		$TopHBoxContainer/PowersHBoxContainer/PuckDash.hide()


func update_IoPhase_HudIcon() -> void:
	if PowerManager.is_io_equipped():
		$TopHBoxContainer/PowersHBoxContainer/IoPhase.show()
	else:
		$TopHBoxContainer/PowersHBoxContainer/IoPhase.hide()


func update_PhobosStrength_HudIcon():
	if PowerManager.is_phobos_equipped():
		$TopHBoxContainer/PowersHBoxContainer/PhobosStrength.show()
	else:
		$TopHBoxContainer/PowersHBoxContainer/PhobosStrength.hide()


func update_TitanPlat_HudIcon():
	if PowerManager.is_titan_equipped():
		$TopHBoxContainer/PowersHBoxContainer/TitanPlat.show()
	else:
		$TopHBoxContainer/PowersHBoxContainer/TitanPlat.hide()


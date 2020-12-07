extends PopupDialog


export var max_active_powers = 2
var active_power_count = 0
var signals_established: bool = false
var show_puck_dash: bool setget set_show_puck_dash
var show_io_phase: bool setget set_show_io_phase
var show_phobos_strength: bool setget set_show_phobos_strength
var show_titan_plat: bool setget set_show_titan_plat


# Child node variable assignments
onready var puck_VBox = get_node("PowersHBox/PuckDashVBox")
onready var puck_checkbox = get_node("PowersHBox/PuckDashVBox/CheckBox")
onready var io_VBox = get_node("PowersHBox/IOPhaseVBox")
onready var io_checkbox = get_node("PowersHBox/IOPhaseVBox/CheckBox")
onready var phobos_VBox = get_node("PowersHBox/PhobosStrengthVBox")
onready var phobos_checkbox = get_node("PowersHBox/PhobosStrengthVBox/CheckBox")
onready var titan_VBox = get_node("PowersHBox/TitanPlatformVBox")
onready var titan_checkbox = get_node("PowersHBox/TitanPlatformVBox/CheckBox")


func _ready() -> void:
	pass


func _on_PowerSelectionPopup_about_to_show() -> void:
	if !signals_established:
		connect_signals()
		signals_established = true


func _on_AcceptBtn_button_up() -> void:
	PowerManager.set_puck_equipped(puck_checkbox.is_pressed())
	PowerManager.set_io_equipped(io_checkbox.is_pressed())
	PowerManager.set_phobos_equipped(phobos_checkbox.is_pressed())
	PowerManager.set_titan_equipped(titan_checkbox.is_pressed())
	unpause()


func _on_CancelBtn_button_up() -> void:
	# Don't do anything, no values are pushed. 
	unpause()


func update_display_content() -> void:
	update_puck_display()
	update_io_display()
	update_phobos_display()
	update_titan_display()


func update_puck_display() -> void:
	update_puck_values()
	update_puck_visibility()


func update_puck_values() -> void: 
	if PowerManager.is_puck_equipped():
		puck_checkbox.set_pressed(true)
		active_power_count += 1
	elif !PowerManager.is_puck_equipped():
		puck_checkbox.set_pressed(false)


func update_puck_visibility() -> void:
	if show_puck_dash:
		puck_VBox.show()
	else: 
		puck_VBox.hide()


func update_io_display():
	update_io_values()
	update_io_visibility()


func update_io_values() -> void: 
	if PowerManager.is_io_equipped():
		io_checkbox.set_pressed(true)
		active_power_count += 1
	elif !PowerManager.is_io_equipped():
		io_checkbox.set_pressed(false)


func update_io_visibility() -> void:
	if show_io_phase:
		io_VBox.show()
	else:
		io_VBox.hide()


func update_phobos_display() -> void:
	update_phobos_values()
	update_phobos_visibility()


func update_phobos_values() -> void: 
	if PowerManager.is_phobos_equipped():
		phobos_checkbox.set_pressed(true)
		active_power_count += 1
	elif !PowerManager.is_phobos_equipped():
		phobos_checkbox.set_pressed(false)


func update_phobos_visibility() -> void:
	if show_phobos_strength:
		phobos_VBox.show()
	else:
		phobos_VBox.hide()


func update_titan_display() -> void:
	update_titan_values()
	update_titan_visibility()


func update_titan_values() -> void: 
	if PowerManager.is_titan_equipped():
		titan_checkbox.set_pressed(true)
		active_power_count += 1
	elif !PowerManager.is_titan_equipped():
		titan_checkbox.set_pressed(false)


func update_titan_visibility() -> void:
	if show_titan_plat:
		titan_VBox.show()
	else:
		titan_VBox.hide()


func _on_CheckBox_toggled(button_pressed: bool) -> void:
	upcate_active_power_count(button_pressed)
	
	if active_power_count < max_active_powers:
		enable_all_checkboxes()
	else:
		if !puck_checkbox.is_pressed():
			puck_checkbox.set_disabled(true)
		if !io_checkbox.is_pressed():
			io_checkbox.set_disabled(true)
		if !phobos_checkbox.is_pressed():
			phobos_checkbox.set_disabled(true)
		if !titan_checkbox.is_pressed():
			titan_checkbox.set_disabled(true)


func unpause() -> void:
	get_tree().paused = false
	hide()


func update_display_location(camera_center: Vector2) -> void:
	var width = rect_size.x * rect_scale.x
	var height = rect_size.y * rect_scale.y
	var x = camera_center.x - (width / 2)
	var y = camera_center.y - (height / 2) 
	var new_position = Vector2(x, y)
	popup()
	rect_position = new_position


func ready_interface(camera_center: Vector2) -> void:
	get_tree().paused = true
	update_display_content()
	update_display_location(camera_center)


func set_show_puck_dash(new_value: bool) -> void: 
	show_puck_dash = new_value


func set_show_io_phase(new_value: bool) -> void: 
	show_io_phase = new_value


func set_show_phobos_strength(new_value: bool) -> void: 
	show_phobos_strength = new_value


func set_show_titan_plat(new_value: bool) -> void: 
	show_titan_plat = new_value


func connect_signals() -> void:
	puck_checkbox.connect("toggled", self, "_on_CheckBox_toggled")
	io_checkbox.connect("toggled", self, "_on_CheckBox_toggled")
	phobos_checkbox.connect("toggled", self, "_on_CheckBox_toggled")
	titan_checkbox.connect("toggled", self, "_on_CheckBox_toggled")


func upcate_active_power_count(button_pressed: bool):
	if button_pressed:
		active_power_count += 1
	else:
		active_power_count -= 1


func enable_all_checkboxes() -> void:
	puck_checkbox.set_disabled(false)
	io_checkbox.set_disabled(false)
	phobos_checkbox.set_disabled(false)
	titan_checkbox.set_disabled(false)

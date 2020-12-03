extends PopupDialog


export var max_active_powers = 2
var active_power_count = 0


# Child node variable assignments
onready var puck_checkbox = get_node("PowersHBox/PuckDashVBox/CheckBox")
onready var io_checkbox = get_node("PowersHBox/IOPhaseVBox/CheckBox")
onready var phobos_checkbox = get_node("PowersHBox/PhobosStrengthVBox/CheckBox")
onready var titan_checkbox = get_node("PowersHBox/TitanPlatformVBox/CheckBox")


func _ready() -> void:
	puck_checkbox.connect("toggled", self, "_on_CheckBox_toggled")
	io_checkbox.connect("toggled", self, "_on_CheckBox_toggled")
	phobos_checkbox.connect("toggled", self, "_on_CheckBox_toggled")
	titan_checkbox.connect("toggled", self, "_on_CheckBox_toggled")


func _on_PowerSelectionPopup_about_to_show() -> void:
	pass


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
	update_puck_values()
	update_io_values()
	update_phobos_values()
	update_titan_values()


func update_puck_values() -> void: 
	if PowerManager.is_puck_equipped():
		puck_checkbox.set_pressed(true)
	elif !PowerManager.is_puck_equipped():
		puck_checkbox.set_pressed(false)


func update_io_values() -> void: 
	if PowerManager.is_io_equipped():
		io_checkbox.set_pressed(true)
	elif !PowerManager.is_io_equipped():
		io_checkbox.set_pressed(false)


func update_phobos_values() -> void: 
	if PowerManager.is_phobos_equipped():
		phobos_checkbox.set_pressed(true)
	elif !PowerManager.is_phobos_equipped():
		phobos_checkbox.set_pressed(false)


func update_titan_values() -> void: 
	if PowerManager.is_titan_equipped():
		titan_checkbox.set_pressed(true)
	elif !PowerManager.is_titan_equipped():
		titan_checkbox.set_pressed(true)


func lock_checkboxes() -> void:
	
	pass


func _on_CheckBox_toggled(button_pressed: bool) -> void:
	# TODO Disable and enable buttons (checkboxes) based on max number of allowed powers
	pass # Replace with function body.



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


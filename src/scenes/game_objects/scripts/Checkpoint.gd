extends Area2D


# Export variables
export var puck_dash_available: bool
export var phobos_strength_available: bool
export var io_phasing_available: bool
export var titan_platforms_available: bool


# Other variables
var player_overlap: bool = false
var player_ref


func _ready() -> void:
	pass # Replace with function body.


func _process(delta: float) -> void:
	check_for_input()


func _on_CheckPoint_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	pass


func check_for_input() -> void:
	if player_overlap and Input.is_action_just_released("checkpoint_action"):
		var camera_center = get_parent().get_node("Player").get_node("Camera2D").get_camera_screen_center()
		print("camera center: " + str(camera_center))
		$PowerSelectionPopup.ready_interface(camera_center)


func _on_CheckPoint_body_entered(body: Node) -> void:
	if body.get_name() == "Player":
		player_overlap = true


func _on_CheckPoint_body_exited(body: Node) -> void:
	if body.get_name() == "Player":
		player_overlap = false


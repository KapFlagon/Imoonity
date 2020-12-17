extends SwitchableObstacle


onready var _visibility_enabler = get_node("VisibilityEnabler2D")
onready var _tip_sprite = get_node("Tip")
onready var _animation_player = get_node("AnimationPlayer")
onready var _shape = get_node("Area2D/CollisionShape2D")
onready var _audio = get_node("SpikeAudio")


func _ready():
	if is_obstacle_active():
		_enable_spike()
	else: 
		_disable_spike()


func _on_VisibilityEnabler2D_screen_entered() -> void:
	if is_obstacle_active():
		_animation_player.play("flash")
		_audio.play()


func _on_VisibilityEnabler2D_screen_exited() -> void:
	_animation_player.stop()


func _connect_visibility_enabler_signals() -> void:
	_visibility_enabler.connect("screen_entered", self, "_on_VisibilityEnabler2D_screen_entered")
	_visibility_enabler.connect("screen_exited", self, "_on_VisibilityEnabler2D_screen_exited")


func _disconnect_visibility_enabler_signals() -> void:
	_visibility_enabler.disconnect("screen_entered", self, "_on_VisibilityEnabler2D_screen_entered")
	_visibility_enabler.disconnect("screen_exited", self, "_on_VisibilityEnabler2D_screen_exited")


func flip_active_state() -> void:
	if is_obstacle_active():
		_disable_spike()
	else:
		_enable_spike()
	.flip_active_state()


func _enable_spike():
	_tip_sprite.show()
	_shape.set_deferred("disabled", false)
	_animation_player.play("flash")
	_audio.play()
	_connect_visibility_enabler_signals()


func _disable_spike():
	_disconnect_visibility_enabler_signals()
	_tip_sprite.hide()
	_shape.set_deferred("disabled", true)
	_animation_player.stop()
	_audio.stop()

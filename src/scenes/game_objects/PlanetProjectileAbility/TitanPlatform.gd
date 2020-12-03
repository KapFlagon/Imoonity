extends StaticBody2D


export (float) var active_time_seconds = 4


# Called when the node enters the scene tree for the first time.
func _ready():
	$platformTimer.set_wait_time(active_time_seconds)
	$platformTimer.start();
	

func _on_platformTimer_timeout():
	queue_free()

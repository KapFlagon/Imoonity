extends Node


#func _ready():
#	var music_file = "res://assets/music/Godot_Slurp_Master1.wav"
#	var stream = AudioStream.new()
#	var music_player = AudioStreamPlayer.new()
#	if File.new().file_exists(music_file):
#		var music = load(music_file)
#		music_player.stream = music
#		music_player.play()
#		print("Hell yes brother")
#
#		# below are optional steps if you need more control
#		var music_bus_id = AudioServer.get_bus_count()
#		AudioServer.add_bus()
#		AudioServer.set_bus_name(music_bus_id,"music")
#		# connects music to master bus
#		AudioServer.set_bus_send(music_bus_id,"Master")
#		add_child(music_player)
#		music_player.bus = "music"


func tutorialLevelMusic():
	var music_file = "res://assets/music/Godot_Slurp_Master1.wav"
	var stream = AudioStream.new()
	var music_player = AudioStreamPlayer.new()
	if File.new().file_exists(music_file):
		var music = load(music_file)
		music_player.stream = music
		music_player.play()

		# below are optional steps if you need more control
		var music_bus_id = AudioServer.get_bus_count()
		AudioServer.add_bus()
		AudioServer.set_bus_name(music_bus_id,"music")
		# connects music to master bus
		AudioServer.set_bus_send(music_bus_id,"Master")
		add_child(music_player)
		music_player.bus = "music"

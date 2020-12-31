extends Node

var music_player
var song_path: String


func _ready():
	set_pause_mode(Node.PAUSE_MODE_PROCESS)
	music_player = AudioStreamPlayer.new()
	var music_bus_id = AudioServer.get_bus_count()
	AudioServer.add_bus()
	AudioServer.set_bus_name(music_bus_id,"music")
	# connects music to master bus
	AudioServer.set_bus_send(music_bus_id,"Master")
	add_child(music_player)
	music_player.bus = "music"
	#play_song(song_path)


func play_song(new_song_path: String):
	if IsValidAudioPath(new_song_path) and new_song_path != song_path:
		song_path = new_song_path
	else:
		return  # If invalid path given, exit without updating audio
	if !music_player.is_playing():
		updateMusicPlayer()
	else:
		music_player.stop()
		updateMusicPlayer()


func IsValidAudioPath(new_song_path: String) -> bool:
	return File.new().file_exists(new_song_path)


func updateMusicPlayer() -> void:
	var music = load(song_path)
	music_player.stream = music
	music_player.play()
	

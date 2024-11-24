extends Node

var music = load("res://fishing music.mp3")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if SettingsManager.music_volume == 0:
		$music.volume_db = -100
	else:
		$music.volume_db = SettingsManager.music_volume * 2

func play_music():
	$music.stream = music
	$music.play()
	


extends Node

onready var voice_over = $VoiceOver
onready var music = $Music
onready var ball_roll = $BallRoll

#voice overs
onready var camera_up : AudioStream = load("res://Assets/VoiceOvers/CameraGuide_UP-Emma.mp3")
onready var camera_down : AudioStream = load("res://Assets/VoiceOvers/CameraGuide_DOWN-Emma.mp3")
onready var camera_pan : AudioStream = load("res://Assets/VoiceOvers/CameraPanGuide-Emma.mp3")
onready var goal : AudioStream = load("res://Assets/VoiceOvers/GoalGuide-Emma.mp3")
onready var lava : AudioStream = load("res://Assets/VoiceOvers/LavaGuid-Emma.mp3")
onready var rotating : AudioStream = load("res://Assets/VoiceOvers/RotatingGuid-Emma.mp3")
onready var zoom : AudioStream = load("res://Assets/VoiceOvers/Zoom.mp3")

#music
onready var main : AudioStream = load("res://Assets/Music/hidden-dreams.mp3")
onready var credits : AudioStream = load("res://Assets/Music/CreditsThemeHiddenDreams.mp3")
onready var title : AudioStream = load("res://Assets/Music/TitleThemeHiddenDreams.mp3")

#sound effects



var current_song : AudioStream = null
var rolling = false

func talk(guide):
	voice_over.stop()
	voice_over.set_stream(guide)
	voice_over.play()


func song(song):
	if song != current_song:
		music.stop()
		music.set_stream(song)
		current_song = song
		music.play()

func ball(start):
	if start == true:
		ball_roll.play()
		rolling = true
	elif start == false:
		rolling = false

	

func music_stop():
	current_song = null
	music.stop()



func _on_Music_finished():
	if current_song:
		music.play()


func _on_BallRoll_finished():
	ball_roll.play()

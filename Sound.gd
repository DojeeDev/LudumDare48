extends Node

onready var voice_over = $VoiceOver
onready var camera_up : AudioStream = load("res://Assets/VoiceOvers/CameraGuide_UP-Emma.mp3")
onready var camera_down : AudioStream = load("res://Assets/VoiceOvers/CameraGuide_DOWN-Emma.mp3")
onready var camera_pan : AudioStream = load("res://Assets/VoiceOvers/CameraPanGuide-Emma.mp3")
onready var goal : AudioStream = load("res://Assets/VoiceOvers/GoalGuide-Emma.mp3")
onready var lava : AudioStream = load("res://Assets/VoiceOvers/LavaGuid-Emma.mp3")
onready var rotating : AudioStream = load("res://Assets/VoiceOvers/RotatingGuid-Emma.mp3")

func talk(guide):
	voice_over.stop()
	voice_over.set_stream(guide)
	voice_over.play()

extends CanvasLayer


func _ready():
	Sound.song(Sound.title)

func _on_Play_pressed():
	SceneChanger.change_scene("res://Level1.tscn")


func _on_Quit_pressed():
	get_tree().quit()

func _on_Credits_pressed():
	SceneChanger.change_scene(("res://Credits.tscn"))

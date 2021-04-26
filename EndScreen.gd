extends CanvasLayer


func _ready():
	Sound.song(Sound.credits)

func _on_Title_pressed():
	SceneChanger.change_scene(("res://Title.tscn"))

func _on_Quit_pressed():
	get_tree().quit()


func _on_Credits_pressed():
	SceneChanger.change_scene(("res://Credits.tscn"))

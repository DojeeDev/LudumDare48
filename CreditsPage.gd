extends CanvasLayer

onready var creator_credits = $UI/CreditText/CreatorCredits
onready var engine_credits = $UI/CreditText/EngineCredits
onready var credits_text = $UI/CreditText

func _ready():
	Sound.song(Sound.credits)

func _on_Creators_pressed():
	creator_credits.popup()


func _on_GameEngine_pressed():
	engine_credits.popup()


func _on_Back_pressed():
	SceneChanger.change_scene("res://Title.tscn")


func _on_Quit_pressed():
	get_tree().quit()


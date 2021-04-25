extends KinematicBody

signal death()

func _on_DeathZone_body_entered(body):
	emit_signal("death")

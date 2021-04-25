extends KinematicBody

signal death()
signal check_point()


func _on_DeathZone_body_entered(body):
	emit_signal("death")


func _on_CheckPoint_body_entered(body):
	emit_signal("check_point")

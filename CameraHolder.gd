extends Spatial

onready var camera = $Camera

export var flyspeed = 45

var velocity = 0

func _physics_process(delta):
	var fly_dir = 0
	
	if Input.is_action_pressed("move_up"):
		fly_dir += 1
	if Input.is_action_pressed("move_down"):
		fly_dir -= 1
	
	velocity = lerp(velocity, flyspeed*fly_dir, 0.2)

	camera.global_transform.origin.y = clamp(camera.global_transform.origin.y+velocity*delta, 27, 100)
	

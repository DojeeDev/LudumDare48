extends Spatial


export var rotation_dir = 1
export var spin_speed = 0.005

func _physics_process(delta):
	$BallBoxMap1.rotate_y(spin_speed)

extends RigidBody

var reset = false
var spawn = Vector3.ZERO

func reset(_spawn):
	reset = true
	spawn = _spawn



func _integrate_forces(state):
	if reset:
		reset = false
		print(1)
		var ball_transform = state.get_transform()
		ball_transform.origin = spawn
		state.set_transform(ball_transform)
		state.set_linear_velocity(Vector3.ZERO)

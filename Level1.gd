extends Spatial

onready var camera_holder = $CameraHolder
onready var box = $BallBoxMap1

var spin = 0.1
var rotate_speed = 0.01
var rotate_velocity = Vector3.ZERO

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	if event.is_action_pressed("LeftClick"):
		if Input.get_mouse_mode() == Input.MOUSE_MODE_VISIBLE:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func _unhandled_input(event):
	if event is InputEventMouseMotion and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		camera_holder.rotate_y(-lerp(0, spin, event.relative.x/10))



func _physics_process(delta):
	var rot_dir = Vector3.ZERO
	
	var forward = -camera_holder.transform.basis.z
	var backward = camera_holder.transform.basis.z
	var left = -camera_holder.transform.basis.x
	var right = camera_holder.transform.basis.x
	
	if Input.is_action_pressed("rotate_north"):
		rot_dir.z += -1
	if Input.is_action_pressed("rotate_south"):
		rot_dir.z += 1
	if Input.is_action_pressed("rotate_west"):
		rot_dir.x += -1
	if Input.is_action_pressed("rotate_east"):
		rot_dir.x += 1
	
	rotate_velocity = lerp(rotate_velocity, rotate_speed*rot_dir, 0.2)
	
	box.rotate(right, rotate_velocity.x)
	box.rotate(backward, rotate_velocity.z)

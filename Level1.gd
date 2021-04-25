extends Spatial

onready var camera_holder = $CameraHolder
onready var camera = $CameraHolder/Camera
onready var box = $BallBoxMap1
onready var ball = $Ball



var spin = 0.1
var rotate_speed = 0.005
var rotate_velocity = Vector3.ZERO
var max_rotate = 58
var camera_pos_level_3 = Vector3.ZERO
var reset = false
var desired_zoom = 0
var zoomed = false


export var save = {
	spawn = Vector3(0,58,0),
	camera_pos = Vector3(-55,85,0),
	camera_holder_rotation = Vector3.ZERO
}
export var max_zoom = -2500

func change_zoom():
	if !zoomed:
		zoomed = true
		desired_zoom = max_zoom
	else:
		zoomed = false
		desired_zoom = 0

func zoom(delta):
	if !is_equal_approx(camera.transform.origin.x, save.camera_pos.x + desired_zoom):
		camera.transform.origin.x = lerp(camera.transform.origin.x, save.camera_pos.x + desired_zoom*delta, 0.2)



func tutorial():
	pass



func _input(event):
	if event.is_action_pressed("camera_zoom"):
		change_zoom()
	if event.is_action_released("restart"):
		restart()
	if event.is_action_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	if event.is_action_pressed("LeftClick"):
		if Input.get_mouse_mode() == Input.MOUSE_MODE_VISIBLE:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func _unhandled_input(event):
	if event is InputEventMouseMotion and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		camera_holder.rotate_y(-lerp(0, spin, event.relative.x/10))



func _physics_process(delta):
	zoom(delta)
	
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
	box.rotation_degrees.x = clamp(box.rotation_degrees.x,-max_rotate, max_rotate)
	box.rotation_degrees.z = clamp(box.rotation_degrees.z,-max_rotate, max_rotate)

func _on_Ball_death():
	restart()

func restart():
	camera.transform.origin = save.camera_pos
	camera_holder.rotation = save.camera_holder_rotation
	box.rotation_degrees = Vector3.ZERO
	ball.reset(save.spawn)




func _on_BallBoxMap1_check_point():
	print(2)
	save.spawn = Vector3(-20,35,-20)
	save.camera_pos = Vector3(-55,48,0)



func _on_OutOfBounds_body_entered(body):
	restart()

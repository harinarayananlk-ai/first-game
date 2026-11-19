extends RigidBody2D

var mouse_pos = Vector2.ZERO
var turn: bool
var dragging = false
var canshoot = false
const maxdragdistance = 500
const shootstrength = 3.0
const RADIUS = 100
var playercolor = playercolormain
const playercolormain = Color.DARK_TURQUOISE
const playercolorsecondary = Color.PALE_TURQUOISE

signal turn_finished

func _draw():
	draw_circle(Vector2.ZERO, RADIUS, playercolor)
	if dragging and canshoot:
		draw_line(Vector2.ZERO, mouse_pos, Color(1,1,1,0.4), 50)
		draw_line(-mouse_pos * 0.8, Vector2.ZERO, Color.BLUE,30)

func _physics_process(_delta):
	if get_parent().teamid == 1:
		turn = get_parent().turnteam1
	elif get_parent().teamid == 2:
		turn = get_parent().turnteam2
	if linear_velocity.length() < 150:
		if turn == true:
			canshoot = true
		else:
			canshoot = false
		playercolor = playercolormain
	queue_redraw()


func _ready():
	queue_redraw()

func _input(event):
	if event is InputEventMouseMotion:
		mouse_pos = get_local_mouse_position()
		if mouse_pos.length() > maxdragdistance:
			mouse_pos = mouse_pos.normalized() * maxdragdistance
		
		queue_redraw()
	
	if event is InputEventMouseButton:
		if event.pressed:
			dragging = true
			queue_redraw()
		else:
			dragging = false
			if canshoot:
				turn_finished.emit()
				linear_velocity = -mouse_pos * shootstrength
				print("Mouse position was: ",mouse_pos)
				print("Current speed is set to: ", linear_velocity)
			canshoot = false
			playercolor = playercolorsecondary
			queue_redraw()

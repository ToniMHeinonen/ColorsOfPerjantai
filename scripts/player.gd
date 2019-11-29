extends KinematicBody2D

var direction = Vector2(0,0)
var startPos = Vector2(0,0)
var moving = false

const SPEED = 1
const GRID = 16

func _ready():
	set_physics_process(true)
	
func _physics_process(delta):
	if !moving:
		if Input.is_action_pressed("ui_up"):
			moving = true
			direction = Vector2(0,-1)
			startPos = position
		
		elif Input.is_action_pressed("ui_down"):
			moving = true
			direction = Vector2(0,1)
			startPos = position
		
		elif Input.is_action_pressed("ui_left"):
			moving = true
			direction = Vector2(-1,0)
			startPos = position
		
		elif Input.is_action_pressed("ui_right"):
			moving = true
			direction = Vector2(1,0)
			startPos = position
		
	else:
		position = position + direction * SPEED
		if position == startPos + Vector2(GRID * direction.x, GRID * direction.y):
			moving = false

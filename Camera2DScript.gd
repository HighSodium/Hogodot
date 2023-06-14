extends Camera2D


# Declare member variables here. Examples:
var camera_move_speed = 10


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if Input.is_action_pressed("ui_up"):
		self.position.y -= camera_move_speed
	if Input.is_action_pressed("ui_down"):
		self.position.y  += camera_move_speed
	if Input.is_action_pressed("ui_left"):
		self.position.x -= camera_move_speed
	if Input.is_action_pressed("ui_right"):
		self.position.x += camera_move_speed
	

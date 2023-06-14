extends Node2D


# Declare member variables here. Examples:
@onready var camera = get_parent().get_node("Camera2D")
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var center = get_viewport_rect().size/2
	self.position.x = center.x
	self.position.y = center.y


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("ui_left"):
		self.scale.x = 1
	if Input.is_action_pressed("ui_right"):
		self.scale.x = -1
		
	self.position = camera.position
		

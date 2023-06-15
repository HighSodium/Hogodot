class_name Player extends Node2D


# Declare member variables here. Examples:
@onready var camera = get_parent().get_node("Camera2D")

@export var maxHealth = 10 
var health = 1


# Called when the node enters the scene tree for the first time.
func _ready():
	health = maxHealth
	updateHealthBar()
	var center = get_viewport_rect().size/2
	self.position.x = center.x
	self.position.y = center.y


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Flip sprite based on horizontal movement
	if Input.is_action_pressed("ui_left"):
		self.scale.x = 1
	if Input.is_action_pressed("ui_right"):
		self.scale.x = -1
		
	self.position = camera.position


func updateHealthBar():
	$HealthBar.scale.x = health/maxHealth
	
# USE hit.call("applyDamage", amtOfDmg, self)

func applyDamage(damage, dmgOwner):
	health -= damage
	updateHealthBar()
	
	print("TOOK ", str(damage) + " DAMAGE FROM ", str(dmgOwner.name))
	print("Health left ", str(health), "\n")
	
	if health <= 0:
		onDeath()

## DO DEATH THINGS
func onDeath():
	print("BLEH! IM DEAD!")
	queue_free()
	


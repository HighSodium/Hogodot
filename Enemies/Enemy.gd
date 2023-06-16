class_name Enemy extends CharacterBody2D

@export var health = 3
@export var speed = 1
@export var enemyName = "Enemy"
@export var damage = 1

@onready var controller = get_node("CharacterBody2D")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	pass
	#var collision = move_and_collide(velocity * delta)
	
			
func CollisionCheck(collision):
	if collision:
		if collision.get_collider().name == "Player":
			var hit = collision.get_collider()
			hit.call("applyDamage", damage, self)
			queue_free()

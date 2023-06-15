extends Node2D

var health = 10
# Called when the node enters the scene tree for the first time.
func _ready():
	print(get_meta("maxHealth"))
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func applyDamage(damage, owner):
	health -= damage
	print("TOOK ", str(damage) + " DAMAGE FROM ", str(owner.name))
	print("Health left	", str(health), "\n")
	
	if health <= 0:
		onDeath()

func onDeath():
	print("BLEH! IM DEAD!")
	queue_free()
	

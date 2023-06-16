class_name Rammer extends Enemy
# Declare member variables here. Examples:
@onready var player = get_parent().get_node("Player")


# Called when the node enters the scene tree for the first time.
func _ready():
	#position = Vector2(500, 500)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	
	# Move boat toward player
	var player_position = player.position
	var playerDir = position.direction_to(player_position) * 1
	var collide = move_and_collide(playerDir)
	CollisionCheck(collide)
	
	# Boat sprite direction
	if velocity.x != 0:
		$CharacterBody2D/Sprite2D.scale.x = -sign(velocity.x)
	
#	if self.position.distance_to(player_position) < 10:
#		player.health -= 0.5
#		self.queue_free()

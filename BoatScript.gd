extends Node2D


# Declare member variables here. Examples:
@onready var player = get_parent().get_node("Player")


# Called when the node enters the scene tree for the first time.
func _ready():
	self.position = Vector2(500, 500)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Move boat toward player
	var player_position = player.position
	var velocity = self.position.direction_to(player_position) * 1
	print(velocity)
	
	# Boat sprite direction
	self.position += velocity
	if velocity.x > 0:
		$Sprite2D.scale.x = -1
	else:	
		$Sprite2D.scale.x = 1
	
	if self.position.distance_to(player_position) < 10:
		self.queue_free()

extends Node2D


# Declare member variables here. Examples:
@onready var player = get_parent().get_node("Player")


# Called when the node enters the scene tree for the first time.
func _ready():
	#position = Vector2(500, 500)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Move boat toward player
	var player_position = player.position
	var velocity = position.direction_to(player_position) * 1
	
	# Boat sprite direction
	position += velocity
	if velocity.x > 0:
		$RigidBody2D.scale.x = -1
	else:
		$RigidBody2D.scale.x = 1
	
#	if self.position.distance_to(player_position) < 10:
#		player.health -= 0.5
#		self.queue_free()



func _on_rigid_body_2d_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body.get_parent().name == "Player":	
		var hit = body.get_parent()
		print("BOAT HIT!")
		hit.call("applyDamage", 1, self)
		queue_free()
		

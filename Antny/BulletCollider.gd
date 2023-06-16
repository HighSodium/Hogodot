extends Node2D

var bulletDamage = 1
var bulletSpeed = 0
var bulletLifetime = 1.5
var bulletAliveTime = 0
var bulletVelocity = Vector2(1,0)


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	bulletAliveTime += delta
	if bulletAliveTime >= bulletLifetime:
		queue_free()
	
	translate(bulletVelocity.normalized() * bulletSpeed)

func setVelocity(vel):
	bulletVelocity = vel

func setSpeed(spd):
	bulletSpeed = spd

func fireBullet(spd, vel):
	setVelocity(vel)
	setSpeed(spd)
	
func _on_rigid_body_2d_body_shape_entered(_body_rid, body, _body_shape_index, _local_shape_index):	
	if body.get_parent().name.to_lower().contains == "enemy":
		var hit = body.get_parent()
		hit.call("applyDamage", bulletDamage, self)
		queue_free()
		pass

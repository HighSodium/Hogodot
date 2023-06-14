extends Node2D

var toSpawn = preload("res://Antny/Projectile_Base.tscn")
var spawnCooldown = 0.01
var timer = 0
var bulletRadians = 0
var firingPattern = PI/1.25

# ---------------------------------------------------------------- #
# Patterns are based on radians and divisions of PI
# 
var Patterns = {LINE=PI, TRIO=PI/1.5, STARFISH=PI/1.25, LEFTRIGHT=PI}
var PatternSpeeds = {STILL=0, SLOWEST=0.007, SLOW=0.01, MEDIUM=0.02, FAST=0.03, FASTEST = 0.05, WILD=0.1}
# ---------------------------------------------------------------- #
func _ready():
	print(firingPattern)
	pass # Replace with function body.


func _process(delta):
	#translate(Vector2(1,0))
	timer += delta
	
	#TODO FIGURE OUT WHY THIS SWITCHES SIDES
	bulletRadians += Patterns.LINE + PatternSpeeds.STILL
	#bulletRadians = position.distance_to(get_parent().get_node("Player").position)
	
	if timer >= spawnCooldown:
		timer = 0
		var spawnedThing = toSpawn.instantiate()
		get_parent().add_child(spawnedThing)
		fireInPattern(spawnedThing, bulletRadians)
		print(bulletRadians)
		
		
		
		
func fireInPattern(projectileObj, radian):
	projectileObj.position = self.position
	projectileObj.call("fireBullet", 5, Vector2(cos(radian),sin(radian)))
	#projectileObj.set("bulletSpeed", 5)
	#projectileObj.set("bulletVelocity", ))

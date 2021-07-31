extends KinematicBody2D

#All varibles to be used-------------------------------------------------------
var speed = 50
var velocity = Vector2()
export var direction = -1
#------------------------------------------------------------------------------
func _ready():
#This will happen when your direction is positive------------------------------
	if direction == 1:
		$AnimatedSprite.flip_h = true
#------------------------------------------------------------------------------
#This code is executed with raycast2D------------------------------------------
	$Stick.position.x = $CollisionShape2D.shape.get_extents().x * direction
#------------------------------------------------------------------------------
#this whole function is for the physics of the enemy---------------------------
func _physics_process(delta):
#This happens when you collide with walls or you are at a clif-----------------
	if is_on_wall()  or not $Stick.is_colliding() and is_on_floor():
		direction = direction * -1
		$AnimatedSprite.flip_h = not $AnimatedSprite.flip_h
		$Stick.position.x = $CollisionShape2D.shape.get_extents().x * direction
#------------------------------------------------------------------------------
#This is for gravity-----------------------------------------------------------
	velocity.y += 20
#------------------------------------------------------------------------------
#This is for speed and movement------------------------------------------------
	velocity.x = speed * direction
#------------------------------------------------------------------------------
#To enable all the physics code------------------------------------------------
	velocity = move_and_slide(velocity,Vector2.UP)
#------------------------------------------------------------------------------
#This whole set of code will emit when player will collide with the top check--
func _on_Top_Check_body_entered(body):
#this will play the squash animation-------------------------------------------
	$AnimatedSprite.play("Squash")
#------------------------------------------------------------------------------
#this will make the moment speed to 0------------------------------------------
	speed = 0
#------------------------------------------------------------------------------
#this is to disable the collision shape 2D-------------------------------------
	set_collision_layer_bit(4,false)
	set_collision_mask_bit(0,false)
#------------------------------------------------------------------------------
#this is to disable the work of top check--------------------------------------
	$"Top Check".set_collision_layer_bit(4,false)
	$"Top Check".set_collision_mask_bit(0,false)
#------------------------------------------------------------------------------
#this is to disable the work of side cheker------------------------------------
	$Side_checker.set_collision_layer_bit(4,false)
	$Side_checker.set_collision_mask_bit(0,false)
#------------------------------------------------------------------------------
#this will start the timer of enemy despwan after attack-----------------------
	$Timer.start()
#------------------------------------------------------------------------------
#when player will hit the side of the enemy scene will reload------------------
func _on_Side_checker_body_entered(body):
	get_tree().reload_current_scene()
#------------------------------------------------------------------------------
#when the aloted time will be over the enemy will delete it self---------------
func _on_Timer_timeout():
	queue_free()
#------------------------------------------------------------------------------

#SUBSCRIE TO HONEST HAMSTER ASAP!!!!!!!



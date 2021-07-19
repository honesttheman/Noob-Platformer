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
#SUBSCRIE TO HONEST HAMSTER ASAP!!!!!!!

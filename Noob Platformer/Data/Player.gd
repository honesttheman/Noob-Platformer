extends KinematicBody2D

#vaiables to store numbers-------------------------------
var motion = Vector2(0,0.2)
var speed = 400
var jumpforce = -1100
var gravity = 35
#--------------------------------------------------------

#for game physics----------------------------------------
func _physics_process(delta):

#controlls,gravity,animation-----------------------------
	if Input.is_action_pressed("right"):
		motion.x = speed
		$AnimatedSprite.play("Walk")
		$AnimatedSprite.flip_h = false

	elif Input.is_action_pressed("left"):
		motion.x = -speed
		$AnimatedSprite.play("Walk")
		$AnimatedSprite.flip_h = true

	else:
		$AnimatedSprite.play("Idle")
	if not is_on_floor():
		$AnimatedSprite.play("Jump")

	motion.y = motion.y + gravity

	if Input.is_action_pressed("jump") and is_on_floor():
		motion.y = jumpforce
#---------------------------------------------------------

#to execute all the physics code--------------------------
	motion = move_and_slide(motion,Vector2.UP)
	motion.x = lerp(motion.x,0,0.2)
#---------------------------------------------------------
#---------------------------------------------------------

#this is not completed,coz this is going according to my
#tutorial series on Honest Hamster so SUBSCRIBE!!!!!!!!!



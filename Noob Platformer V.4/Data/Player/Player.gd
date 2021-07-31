extends KinematicBody2D

#vaiables to store numbers----------------------------------------
var motion = Vector2(0,0.2)
var speed = 400
var jumpforce = -1100
var gravity = 35
#-----------------------------------------------------------------
#for player physics-----------------------------------------------
func _physics_process(delta):
#controlls,gravity,animation-------------------------------------
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
#-----------------------------------------------------------------
#to execute all the physics code----------------------------------
	motion = move_and_slide(motion,Vector2.UP)
	motion.x = lerp(motion.x,0,0.2)
#-----------------------------------------------------------------
#-----------------------------------------------------------------
#When Player falls off the platform this code executes------------
func _on_Fall_Trigger_body_entered(body):
	if body.name == "Player":
		get_tree().reload_current_scene()

#For level 2------------------------------------------------------
func _on_Fall_Trigger_Level_2_body_entered(body):
	if body.name == "Player":
		get_tree().reload_current_scene()
#-----------------------------------------------------------------
#When the Player finsishes a level this code executes.------------
func _on_Gateway_level_1_body_entered(body):
	if body.name == "Player":
		get_tree().change_scene("res://Data/Levels/World.tscn")
#For level 2------------------------------------------------------
func _on_Gateway_body_entered(body):
	if body.name == "Player":
		get_tree().change_scene("res://Data/Levels/World 2.tscn")
#-----------------------------------------------------------------


#SUBSCRIE TO HONEST HAMSTER ASAP!!!!!!!


extends KinematicBody2D








func _on_DeathTrap_body_entered(body):
	if body.name == "Player":
		get_tree().reload_current_scene()

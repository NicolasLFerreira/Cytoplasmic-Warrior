extends Area2D

func _kill_area(body):
	
	if (body.get_name() == "PlayerBodyPhysics"):
		body.queue_free();
		get_tree().reload_current_scene();
	
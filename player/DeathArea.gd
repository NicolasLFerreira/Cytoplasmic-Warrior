extends Area2D

func _on_deadlyobject_entered(body):
	
	if (body.get_name() == "DeadlyObjectsTileSet"):
		get_tree().reload_current_scene();
	
	if (body.get_name() == "Base"):
		print("atingiu inimigo")

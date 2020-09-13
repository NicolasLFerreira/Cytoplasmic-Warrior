extends Area2D

func _on_player_entered(body):
	if (body.get_name() == "PlayerBodyPhysics"):
		get_cp.spawn_node = self.get_name();

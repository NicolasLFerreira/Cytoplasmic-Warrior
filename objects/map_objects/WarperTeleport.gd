extends Area2D

func _on_player_animation_entered(area):
	
	if (area.get_name() == "PlayerArea"):
		$WarperSprite.play("Opening");

extends Area2D

func _on_CrystalArea_body_entered(body):
	if (body.get_name() == "PlayerBodyPhysics"):
		get_tree().change_scene("res://gui/menu_screens/WinMenu.tscn");

extends Control

func _process(delta):
	
	$Stats/Stamina.text = "Stamina: " + str(get_parent().stamina);
	$Stats/Power.text = "Power: " + str(get_parent().power);
	
	if (get_parent().get_node("ReloadProjectileTimer").time_left == 0):
		$Stats/Projectile.text = "Ready!";
	else:
		$Stats/Projectile.text = "Reloading";

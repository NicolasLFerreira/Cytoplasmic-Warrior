extends Control

func _process(delta):
	
	$Box/Stats/Stamina.text = "Stamina: " + str(get_parent().stamina);
	$Box/Stats/Power.text = "Power: " + str(get_parent().power);
	
	if (get_parent().get_node("ReloadProjectileTimer").time_left == 0):
		$Box/Stats/Projectile.text = "Ready!";
	else:
		$Box/Stats/Projectile.text = "Reloading";

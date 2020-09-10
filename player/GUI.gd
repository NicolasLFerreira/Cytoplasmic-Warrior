extends Control

func _process(delta):
	
	$Stats.text = "Stamina: " + str(get_parent().stamina) + "\nPower: " + str(get_parent().power);

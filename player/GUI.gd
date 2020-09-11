extends Control

func _process(delta):
	
	$Stamina.text = "Stamina: " + str(get_parent().stamina)
	$Power.text = "Power: " + str(get_parent().power);
	

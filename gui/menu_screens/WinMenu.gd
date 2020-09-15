extends Control

func _ready():
	
	$Menu/MiddleRow/Stats.text = "Stats:\n-> enemies killed: " + str(global_script.killed_enemies) + " / total -> " + str(global_script.enemies) + "\n-> times died: " + str(global_script.times_death);

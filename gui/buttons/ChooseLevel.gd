extends Button

export var level = 0;

func _ready():
	global_script.spawn_node = "Spawn";
	global_script.killed_enemies = 0;
	global_script.times_death = 0;
	$ButtonText.text = "Level: " + str(level);

func _on_LevelX_pressed():
	get_tree().change_scene("res://maps/Levels/Level" + str(level) + ".tscn");

func _on_TutorialButton_pressed():
	get_tree().change_scene("res://maps/TutorialMap.tscn");

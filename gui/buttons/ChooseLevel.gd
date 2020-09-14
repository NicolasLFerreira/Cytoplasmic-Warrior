extends Button

export var level = 0;

func _ready():
	$ButtonText.text = "Level: " + str(level);

func _on_LevelX_pressed():
	get_tree().change_scene("res://maps/Levels/Level" + str(level) + ".tscn");

func _on_TutorialButton_pressed():
	get_tree().change_scene("res://maps/TutorialMap.tscn");

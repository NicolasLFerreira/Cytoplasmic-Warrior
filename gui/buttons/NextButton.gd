extends Button

export var scene = "-";

func _on_NextTutorialButton_pressed():
	get_tree().change_scene(scene);

extends Button

export var scene = "-";

func _on_BackButton_pressed():
	get_tree().change_scene(scene);

extends Control


func _on_PlayButton_pressed():
	get_tree().change_scene("res://gui/menu_screens/LevelSelectionMenu.tscn")

func _on_SettingsButton_pressed():
	pass

func _on_TutorialButton_pressed():
	pass

func _on_QuitButton_pressed():
	get_tree().quit();

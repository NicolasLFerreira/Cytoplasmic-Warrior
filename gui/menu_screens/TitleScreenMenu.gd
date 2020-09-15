extends Control


func _on_PlayButton_pressed():
	get_tree().change_scene("res://gui/menu_screens/LevelSelectionMenu.tscn");

func _on_SettingsButton_pressed():
	get_tree().change_scene("res://gui/menu_screens/SettingsScreenMenu.tscn");

func _on_TutorialButton_pressed():
	get_tree().change_scene("res://gui/menu_screens/Tutorial1Menu.tscn");

func _on_QuitButton_pressed():
	get_tree().quit();

func _on_CreditsButton_pressed():
	get_tree().change_scene("res://gui/menu_screens/CreditsMenu.tscn");

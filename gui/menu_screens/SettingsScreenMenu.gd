extends Control

func _ready():
	$Menu/MiddleRow/Buttons/FullscreenButton/ButtonText.text = "Fullscreen: " + str(OS.window_fullscreen);
	$Menu/MiddleRow/Buttons/MusicButton/ButtonText.text = "Music: " + str(global_script.music);
	$Menu/MiddleRow/Buttons/GodModeButton/ButtonText.text = "Cheatmode: " + str(global_script.cheatmode);

func _on_FullscreenButton_pressed():
	OS.window_fullscreen = !OS.window_fullscreen;
	$Menu/MiddleRow/Buttons/FullscreenButton/ButtonText.text = "Fullscreen: " + str(OS.window_fullscreen);

func _on_MusicButton_pressed():
	global_script.music = !global_script.music;
	print("music: " + str(global_script.music))
	$Menu/MiddleRow/Buttons/MusicButton/ButtonText.text = "Music: " + str(global_script.music);

func _on_GodModeButton_pressed():
	global_script.cheatmode = !global_script.cheatmode;
	$Menu/MiddleRow/Buttons/GodModeButton/ButtonText.text = "Cheatmode: " + str(global_script.cheatmode);

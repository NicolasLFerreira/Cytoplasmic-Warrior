extends Node2D

var player_pos = Vector2();

func _ready():
	$PlayerBodyPhysics.position = get_node("Checkpoints").get_node(global_script.spawn_node).position;
	global_script.enemies = $Enemies.get_child_count();

func _process(delta):
	if (global_script.music and !$Music.playing):
		$Music.play();

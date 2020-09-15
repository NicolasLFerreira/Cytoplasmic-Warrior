extends Node2D

var player_pos = Vector2();
onready var spawn_node = global_script.spawn_node;

func _ready():
	$PlayerBodyPhysics.position = get_node("Checkpoints").get_node(spawn_node).position;
	global_script.enemies = $Enemies.get_child_count();
	global_script.spawn_node = "Spawn";

func _process(delta):
	if (global_script.music and !$Music.playing):
		$Music.play();

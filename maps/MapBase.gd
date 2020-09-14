extends Node2D

var music = global_script.music;
var player_pos = Vector2();
onready var spawn_node = global_script.spawn_node;

func _ready():
	$PlayerBodyPhysics.position = get_node("Checkpoints").get_node(spawn_node).position;

func _process(delta):
	if (music):
		if (!$Music.playing):
			$Music.play();

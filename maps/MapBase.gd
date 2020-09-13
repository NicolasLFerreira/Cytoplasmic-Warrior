extends Node2D

var player_pos = Vector2();
onready var spawn_node = get_cp.spawn_node;

func _ready():
	$PlayerBodyPhysics.position = get_node("Checkpoints").get_node(spawn_node).position;

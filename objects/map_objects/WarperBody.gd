extends KinematicBody2D

var player_in = false;
var killable = false;
export var teleport = "Warper";

# Animation

func _on_player_animation_entered(body):
	if (body.get_name() == "PlayerBodyPhysics"):
		$WarperSprite.play("opening");
		player_in = true;

func _on_player_animation_exited(body):
	if (body.get_name() == "PlayerBodyPhysics"):
		$WarperSprite.play("opening",true);
		player_in = false;

func _on_opening_finished():
	if (player_in):
		$WarperSprite.play("opened");
	else:
		$WarperSprite.play("closed");

# Teleport

func _on_player_entered(body):
	if (body.get_name() == "PlayerBodyPhysics" and body.power == 100):
		body.position = get_parent().get_node(teleport).position + Vector2(0, -100);
		body.power = 0;

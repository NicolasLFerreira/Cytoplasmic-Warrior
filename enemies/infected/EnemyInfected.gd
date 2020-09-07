extends KinematicBody2D

var movement_speed = 150;
var vector = Vector2();
var gravity = 10;

var body_ = preload("res://player/PlayerBodyPhysics.tscn");

func _physics_process(delta):
	
	vector = move_and_slide(vector, Vector2(0, -1));
	
	if (!is_on_floor()):
		vector.y += gravity;
	

func _finder_entered(body):
	pass;

func _finder_exited(body):
	pass;

extends KinematicBody2D

var movement_speed = 150;
var vector = Vector2();
var gravity = 10;

func _physics_process(delta):
	
	vector = move_and_slide(vector, Vector2(0, -1));
	
	if (!is_on_floor()):
		vector.y += gravity;
	
	movement();
	

func movement():
	
	vector.x = movement_speed;

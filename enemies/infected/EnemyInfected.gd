extends KinematicBody2D

var movement_speed = 150;
var vector = Vector2();

func _physics_process(delta):
	
	vector = move_and_slide(vector, Vector2(0, -1));
	
	movement();
	

func movement():
	
	vector.x = movement_speed;

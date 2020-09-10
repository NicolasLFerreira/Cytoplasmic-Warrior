extends KinematicBody2D

# Movement

var vector = Vector2();
var factor = 3;
export var movement_speed = 50;

var cooldown = false;

# Find player

var inside = false;
onready var obj = get_parent().get_node("PlayerBodyPhysics");

# Movement function

func _physics_process(delta):
	vector = move_and_slide(vector);  
	
	if (inside and !cooldown):
		if (obj.global_position.x - global_position.x > 0):
			vector.x = max(vector.x-movement_speed, movement_speed * factor);
			$EnemyBodySprite.flip_h = false;
		else:
			vector.x = min(vector.x+movement_speed, -movement_speed * factor);
			$EnemyBodySprite.flip_h = true;
	

# Called when player enters area

func _on_body_entered(body):
	if (body.get_name() == "PlayerBodyPhysics"):
		
		# Movement
		
		inside = true;
		factor = 3;
		
		# Animation and point mark
		
		$EnemyBodySprite.play("moving");
		$ExclamationMark.play("default");

func _on_body_exited(body):
	if (body.get_name() == "PlayerBodyPhysics"):
		
		# Movement
		
		inside = false;
		factor = 0;
		vector.x = 0;
		
		# Animation and point mark
		
		$EnemyBodySprite.play("idle");
		$ExclamationMark.play("default", true);

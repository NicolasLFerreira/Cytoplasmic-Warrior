extends KinematicBody2D

# Physics

var vector = Vector2();
var gravity = 10;
var jump = false;

# Combat

var killable = true;
var attack = true;

# Movement

var factor = 3;
export var movement_speed = 50;
export var jump_speed = -350;

var cooldown = false;

# Find player

var inside = false;
onready var obj = get_parent().get_parent().get_node("PlayerBodyPhysics");

# Movement function

func _physics_process(delta):
	
	# Physics
	
	vector = move_and_slide(vector, Vector2(0, -1));  
	if (!is_on_floor()):
		vector.y += gravity;
	
	# Movement
	
	if (!obj.mortal):
		attack = false;
		print("Go back true")
	else:
		attack = true;
	
	if (inside):
		if (attack):
			print("sim")
			if (obj.global_position.x - global_position.x > 0):
				vector.x = max(vector.x-movement_speed, movement_speed * factor);
				$EnemyBodySprite.flip_h = true;
			else:
				vector.x = min(vector.x+movement_speed, -movement_speed * factor);
				$EnemyBodySprite.flip_h = false;
		if (!attack):
			print("nao")
			if (obj.global_position.x - global_position.x > 0):
				vector.x = max(vector.x-movement_speed, movement_speed * -factor);
				$EnemyBodySprite.flip_h = true;
			else:
				vector.x = min(vector.x+movement_speed, -movement_speed * -factor);
				$EnemyBodySprite.flip_h = false;
	
	# Jump
	
	if (jump and is_on_floor() and $EnemyBodySprite.get_animation() == "moving"):
		vector.y += jump_speed;

# Called when player enters area

func _on_body_entered(body):
	
	# Start following
	
	if (body.get_name() == "PlayerBodyPhysics"):
		
		# Movement
		
		inside = true;
		factor = 3;
		
		# Animation and point mark
		
		$EnemyBodySprite.play("moving");
		$ExclamationMark.play("default");

func _on_body_exited(body):
	
	# Stop following
	
	if (body.get_name() == obj.name):
		
		# Movement
		
		inside = false;
		factor = 0;
		vector.x = 0;
		
		# Animation and point mark
		
		$EnemyBodySprite.play("idle");
		$ExclamationMark.play("default", true);

# Jump

func _on_tileset_enter(body):
	if (body.get_name() == "TileSet"):
		jump = true;

func _on_tileset_exit(body):
	jump = false;

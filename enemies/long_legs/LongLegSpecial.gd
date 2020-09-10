extends "res://enemies/base/EnemyBaseMovement.gd"

onready var dir = obj.global_position.x - get_parent().global_position.x;

func _physics_process(delta):
	if (true and !cooldown):
		if (dir > -250 and dir < 250):
			cooldown = true;
			vector.x = max(vector.x-movement_speed, movement_speed * -30);
			$Timer.start();

func _on_Timer_timeout():
	cooldown = false;

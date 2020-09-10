extends "res://enemies/base/EnemyBaseMovement.gd"

func _physics_process(delta):
	var dir = obj.global_position.x - get_parent().global_position.x;
	if (false):
		if (dir > -100 and dir < 100):
			cooldown = true;
			vector.x = max(vector.x-movement_speed, movement_speed * -30);
			$Timer.start();

func _on_Timer_timeout():
	cooldown = false;

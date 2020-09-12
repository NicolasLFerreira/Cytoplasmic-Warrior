extends "res://enemies/base/EnemyBaseMovement.gd"

func _on_projectile_entered(body):
	if (body.get_name() == "ProjectileBody1"):
		vector.y += jump_speed;

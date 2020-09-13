extends "res://enemies/base/EnemyBaseMovement.gd"

func _on_projectile_entered(area):
	if (area.get_name() == "ProjectileBody"):
		vector.y += jump_speed * 2;

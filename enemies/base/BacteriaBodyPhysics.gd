extends "res://enemies/base/EnemyBaseMovement.gd"

func _on_AttackJumpArea_body_entered(body):
	if (body.get_name() == "PlayerBodyPhysics"):
		attack_jump = true;

func _on_AttackJumpArea_body_exited(body):
	if (body.get_name() == "PlayerBodyPhysics"):
		attack_jump = false;

func _on_projectile_entered(area):
	if (area.get_name() == "ProjectileBody"):
		vector.y = jump_speed;

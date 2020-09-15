extends Area2D

export var speed = 500;
var direction = 0;
var horizontal = true;
var flip = false;
var shoot = true;

func _ready():
	$LifeSpan.start();
	set_as_toplevel(true);

func _process(delta):
	if (horizontal):
		position.x += direction * speed * delta;
	else:
		position.y += speed * delta;
		rotation_degrees = 90;
	$ProjectileSprite.flip_h = flip;

func _on_bullet_body_entered(body):
	
	if (shoot):
		if (body.is_a_parent_of(self)):
			return;
		else:
			if (body.get_class() == "TileMap" or (body.get_name() == "PlayerPhysicsBody" or !body.killable)):
				queue_free();
			else:
				global_script.killed_enemies += 1;
				body.queue_free();
				queue_free();

func _on_LifeSpan_timeout():
	queue_free();

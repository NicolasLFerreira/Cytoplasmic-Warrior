extends Area2D

export var speed = 400;
var direction = 0;
var isHorizontal = true;
var flip = false;
var shoot = true;

func _ready():
	set_as_toplevel(true);

func _process(delta):
	if (isHorizontal):
		position.x += direction * speed * delta;
	else:
		position.y += direction * speed * delta;
	$ProjectileSprite.flip_h = flip;

func _on_bullet_body_entered(body):
	
	if (shoot):
		print("shoot")
		if body.is_a_parent_of(self):
			return;
		else:
			if (body.get_class() == ("TileMap")) or (body.get_name() == ("PlayerPhysicsBody")):
				queue_free();
			else:
				body.queue_free();

func _on_view_camp_screen_exited():
	queue_free();

extends KinematicBody2D

# Physics constants

const gravity = 5;
var vector = Vector2(0, 1);

export var die = true;

# Movement variables

const movement_speed_base = 45;
var movement_speed = movement_speed_base;
var speed_jump = -300;
var sneak_factor = 3;

# Stamina variables

const stamina_cap = 100;
var stamina_regen = 5;
var stamina_cost = 5;
var stamina = 100;
var tired = false;

# Power

const power_cap = 100;
var power_regen = 10;
var power = 100;

const base_factor = 15;
var dash_factor = 30;

# Dev & Jokes

var god_mode = false;
var god_speed = 250;

func _process(delta):
	
	# Debug label
	
	# Dev tools
	
	if (Input.is_action_just_pressed("G")):
		god_mode = !god_mode;
	
	# God mode
	
	if (god_mode):
		
		# Up down fly
		
		if (key("up")):
			vector.y -= god_speed;
		
		if (key("down")):
			vector.y += god_speed;
		
		# Unlimited stuff
		
		power = power_cap;
		stamina = stamina_cap;
		
		# Immortality
		
		die = false;
	else:
		die = true;
	

func _physics_process(_delta):
	
	# Physics dependent functions
	
	movement();
	skill();
	stamina();
	
	# Movement and ground definition
	
	vector = move_and_slide(vector, Vector2(0, -1));
	
	# 'is_on_floor' conditions
	
	if (!is_on_floor()):
		
		# Gravity
		
		if (!god_mode):
			vector.y += gravity;
			vector.y += gravity;
		else:
			vector.y = 0;
		
		# Inertia
		
		vector.x = lerp(vector.x, 0, 0.03);
	else:
		vector.x = lerp(vector.x, 0, 0.3);
	
	# Walking animation
	
	if (!key("walk_left") and !key("walk_right")):
		$PlayerSprite.play("idle");
	else:
		$PlayerSprite.play("moving");
	

# Shortner

func key(key):
	
	if (Input.is_action_pressed(key)):
		return true;
	else: 
		return false;

# Walking, running and jumping function

func movement():
	
	# Walking right
	
	if (key("walk_right")):
		vector.x = max(vector.x-movement_speed, movement_speed * 4);
		$PlayerSprite.flip_h = false;
		dash_factor = base_factor;
	
	# Walking left
	
	if (key("walk_left")):
		vector.x = min(vector.x+movement_speed, -movement_speed * 4);
		$PlayerSprite.flip_h = true;
		dash_factor = -base_factor;
	
	# Jumping
	
	if (key("jump") and is_on_floor()):
		vector.y = speed_jump;

# Stamina

func stamina():
	
	# Cooldown for when stamina reaches 0
	
	if (stamina <= 0):
		tired = true;
	
	if (stamina == stamina_cap):
		tired = false;
	
	# Fix stamina
	
	if (stamina > stamina_cap):
		stamina = stamina_cap;
		$StaminaRegenTimer.stop();
	
	# Running
	
	
	if (!tired and key("sprint") and (key("walk_right") or key("walk_left"))):
		movement_speed = movement_speed_base * 2;
		if ($StaminaCostTimer.time_left == 0):
			$StaminaCostTimer.start();
			$StaminaRegenTimer.stop();
			$PlayerSprite.get_sprite_frames().set_animation_speed("moving", 9.0);
	# Sneaking
	else:
		if (key("sneak")):
			movement_speed = movement_speed_base / sneak_factor;
			$PlayerSprite.get_sprite_frames().set_animation_speed("moving", 3.0);
		else:
			movement_speed = movement_speed_base;
			$PlayerSprite.get_sprite_frames().set_animation_speed("moving", 6.0);
		$StaminaCostTimer.stop();
	if (stamina < stamina_cap and $StaminaRegenTimer.time_left == 0 and !key("sprint")):
		$StaminaRegenTimer.start();

# Dash, air jump, dodge and spray function

func skill():
	
	# Dash
	
	if (Input.is_action_just_pressed("dash") and power >= 30):
		vector.x = movement_speed * dash_factor;
		power -= 30;
	
	# Air Jump
	
	if (Input.is_action_just_pressed("air_jump") and power >= 40 and !is_on_floor()):
		vector.y = speed_jump;
		power -= 40;
	
	# Dodge
	
	if (Input.is_action_just_pressed("dodge")):
		$DodgeTimer.start();
		if ($DodgeTimer.time_left != 0):
			die = false;
			$PlayerSprite.flip_v = true;
		power -= 70
	if ($DodgeTimer.time_left == 0):
		die = true;
		$PlayerSprite.flip_v = false;
	
	# Spray
	
	if (key("spray")):
		pass
	
	# Teleport
	
	if (Input.is_action_just_pressed("teleport")):
		self.position.x += movement_speed * dash_factor / 5;
	
	# Power conversion
	
	if (Input.is_action_just_pressed("convert")):
		stamina = power / 2;
		tired = false;
		power = 0;
	
	# Regen
	
	if (power < power_cap and $PowerRegenTimer.is_stopped()):
		$PowerRegenTimer.start();
	

# Shooting

func _shoot():
	
	if (Input.is_action_just_pressed("shoot")):
		pass

# Timer functions

func _stamina_cost_timer():
	stamina -= stamina_cost;

func _stamina_regen_timer():
	stamina += stamina_regen;

func _power_regen_timer():
	power += power_regen;

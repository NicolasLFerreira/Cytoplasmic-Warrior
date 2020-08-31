extends KinematicBody2D

# Physics constants

const gravity = 10;
var vector = Vector2(0, 1);

export var die = true;

# Movement variables

const movement_speed_base = 50;
var movement_speed = movement_speed_base;
var speed_jump = -300;

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
var dash_factor = 15;

func _process(delta):
	
	# Debug label
	
	$GUI.text = "Stamina: " + str(stamina) + "\nTimer: " + str($StaminaCostTimer.time_left) + "\nTimer: " + str($StaminaRegenTimer.time_left) + "\nPower: " + str(power);

func _physics_process(_delta):
	
	# Movement and ground definition
	
	vector = move_and_slide(vector, Vector2(0, -1));
	
	# 'is_on_floor' conditions
	
	if (!is_on_floor()):
		
		# Gravity
		
		vector.y += gravity;
		
		# Inertia
		
		vector.x = lerp(vector.x, 0, 0.03)
	else:
		vector.x = lerp(vector.x, 0, 0.25)
	
	#Physics dependent functions
	
	movement();
	skill();
	stamina();
	

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
	else:
		movement_speed = movement_speed_base;
		$StaminaCostTimer.stop();
	if (stamina < stamina_cap and $StaminaRegenTimer.time_left == 0 and !key("sprint")):
		$StaminaRegenTimer.start();

# Dash, air jump, dodge and spray function

var pos = Vector2();

func skill():
	
	# Dash
	
	if (Input.is_action_just_pressed("dash") and power >= 30):
		vector.x = movement_speed * dash_factor;
		#self.position += Vector2(100, 0); This works like a teleport.
		power -= 30;
	
	# Air Jump
	
	if (Input.is_action_just_pressed("air_jump") and power >= 50):
		vector.y = speed_jump;
		power -= 50;
	
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
		pass;
	else:
		pass;
	
	# Regen
	
	if (power < power_cap and $PowerRegenTimer.is_stopped()):
		$PowerRegenTimer.start();
	
	# Test
	
	if (Input.is_action_just_pressed("click_l")):
		pos = get_local_mouse_position();
	
	if (Input.is_action_just_pressed("teleport")):
		vector += pos;
		vector += pos;

# Timer functions

func _stamina_cost_timer():
	stamina -= stamina_cost;

func _stamina_regen_timer():
	stamina += stamina_regen;

func _power_regen_timer():
	power += power_regen;

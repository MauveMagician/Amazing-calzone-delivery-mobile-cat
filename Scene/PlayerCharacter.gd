extends RigidBody2D

export var thrustForce = 400

var thrust = Vector2()
var can_jump = false
var jump = Vector2()
var new_seed = [0,42]
var rank = ""
onready var ray = get_node("RayCast2D")
onready var ray2 = get_node("RayCast2D2")
onready var ray3 = get_node("RayCast2D3")
onready var ray4 = get_node("RayCast2D4")
onready var ray5 = get_node("RayCast2D5")
onready var ray6 = get_node("RayCast2D6")
onready var ray7 = get_node("RayCast2D7")
onready var calzones = [$Calzone, $Calzone2, $Calzone3, $Calzone4, $Calzone5]

func calzonePop(calzone):
	calzones.remove(calzones.find(calzone))

func get_input():
	if Input.is_action_pressed("ui_left"):
		thrust = Vector2(-thrustForce, 0)
	elif Input.is_action_pressed("ui_right"):
		thrust = Vector2(thrustForce, 0)
	else:
		thrust = Vector2(0,0)
	if Input.is_action_just_pressed("ui_accept") and can_jump:
		jump = Vector2(0, -400)
	if Input.is_action_pressed("ui_retry"):
		LevelManager.call_deferred('loadLevel')
		queue_free()

func burn():
	self.new_seed = rand_seed(new_seed[1])
	self.angular_velocity = (self.new_seed[0] % 3) * 3 + 3

func turbo():
	self.apply_impulse(Vector2(0,0), Vector2(200,0))
	for i in calzones:
		i.apply_impulse(Vector2(0,0), Vector2(100,0))

func takeDamage():
	if calzones.size() < 1:
		self.die()

func die():
	var losescreen = preload("res://scene/DeathScreen.tscn").instance()
	self.find_node("UI Layer").add_child(losescreen)

func win():
	Tada.play()
	get_tree().paused = true
	RankManager.setRank(calzones.size(), float($"UI Layer/Control/TimeElapsed".text))
	var winscreen = preload("res://scene/WinScreen.tscn").instance()
	winscreen.calzones = calzones.size()
	self.find_node("UI Layer").add_child(winscreen)

func hell_win():
	Tada.play()
	get_tree().paused = true
	RankManager.setRank(calzones.size(), float($"UI Layer/Control/TimeElapsed".text))
	var winscreen = preload("res://scene/HellWinScreen.tscn").instance()
	winscreen.calzones = calzones.size()
	self.find_node("UI Layer").add_child(winscreen)

func _ready():
	rank = RankManager.get()
	$"UI Layer/Control/RankLetter".text = str(rank)
	pass

func _process(delta):
	get_input()

func _physics_process(delta):
	if thrust != Vector2(0,0):
		$Sprite/Sprite2.rotation += thrust.x/abs(thrust.x) * deg2rad(10)
		$Sprite/Sprite3.rotation += thrust.x/abs(thrust.x) * deg2rad(10)
		if not MotorSound.is_playing():
			MotorSound.play()
	elif MotorSound.is_playing():
		MotorSound.stop()
	self.set_applied_force(thrust + ray.get_collision_normal())
	if ray.is_colliding() or ray2.is_colliding() or ray3.is_colliding() or ray4.is_colliding() or ray5.is_colliding() or ray6.is_colliding() or ray7.is_colliding():
		if(jump != Vector2(0,0)):
			JumpSound.play()
			self.apply_impulse(Vector2(0,0), jump)
			for i in calzones:
				if i != null:
					if i.has_method("apply_impulse"):
						if i.is_on_character():
							i.apply_impulse(Vector2(0,0), jump)
			jump = Vector2(0,0)
		self.mode = MODE_CHARACTER
	elif not (ray.is_colliding()):
		self.mode = MODE_RIGID

func _on_JumpTimer_timeout():
	can_jump = true

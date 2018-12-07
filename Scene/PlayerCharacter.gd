extends RigidBody2D

var thrust = Vector2()
var jump = Vector2()
onready var ray = get_node("RayCast2D")

func get_input():
	if Input.is_action_pressed("ui_left"):
		thrust = Vector2(-300, 0)
	elif Input.is_action_pressed("ui_right"):
		thrust = Vector2(300, 0)
	else:
		thrust = Vector2(0,0)
	if Input.is_action_just_pressed("ui_accept"):
		jump = Vector2(0, -500)
	else:
		jump = Vector2(0,0)

func _ready():
	pass

func _process(delta):
	get_input()

func _physics_process(delta):
	self.set_applied_force(thrust)
	if(ray.is_colliding()):
		self.apply_impulse(Vector2(0,0), jump)
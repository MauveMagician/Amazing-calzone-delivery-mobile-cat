extends RigidBody2D

onready var ray = $RayCast2D
onready var fallRay = $FallRayCast

func is_on_character():
	if ray.is_colliding():
		return true

func explode():
	queue_free()

func _physics_process(delta):
	if fallRay.is_colliding():
		self.explode()
	pass

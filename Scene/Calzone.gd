extends RigidBody2D

onready var ray = $RayCast2D
onready var fallRay = $FallRayCast
signal explodeSignal

func is_on_character():
	if ray.is_colliding():
		return true

func explode():
	emit_signal("explodeSignal")
	queue_free()
	get_parent().calzonePop(self)

func _physics_process(delta):
	if fallRay.is_colliding():
		self.explode()
		get_parent().takeDamage()
	pass

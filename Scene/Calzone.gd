extends RigidBody2D

onready var ray = $RayCast2D
onready var fallRay = $FallRayCast
onready var fallRay2 = $FallRayCast2
onready var fallRay3 = $FallRayCast3
signal explodeSignal

func is_on_character():
	if ray.is_colliding():
		return true

func explode():
	emit_signal("explodeSignal")
	queue_free()
	get_parent().calzonePop(self)
	pass

func _physics_process(delta):
	if fallRay.is_colliding() or fallRay2.is_colliding() or fallRay3.is_colliding():
		self.explode()
		get_parent().takeDamage()
	pass

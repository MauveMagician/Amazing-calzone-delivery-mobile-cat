extends Area2D

func _on_Fire_body_entered(body):
	if body.has_method("burn"):
		queue_free()
		body.burn()
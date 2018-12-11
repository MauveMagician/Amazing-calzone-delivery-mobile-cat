extends Area2D

func _ready():
	get_tree().paused = false

func _on_Customer_body_entered(body):
	if body.has_method("win"):
		body.win()
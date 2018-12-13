extends Node

func _ready():
	pass

func _input(event):
	if Input.is_action_pressed("ui_accept"):
		LevelManager.call_deferred('loadLevel')
		queue_free()
extends NinePatchRect

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	get_tree().paused = true
	get_node("../Timer").stop()

func _input(event):
	if Input.is_action_pressed("ui_retry") or Input.is_action_pressed("ui_accept"):
		LevelManager.call_deferred('loadLevel')
		queue_free()
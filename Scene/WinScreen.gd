extends NinePatchRect

var accept = false
var calzones = 5

func _ready():
	get_tree().paused = true
	get_node("../Timer").stop()

func showNext():
	if not $VBoxContainer/TimeLabel.visible:
		$VBoxContainer/TimeLabel.text = $VBoxContainer/TimeLabel.text + " " + get_node("../Control/TimeElapsed").text
		$VBoxContainer/TimeLabel.visible = true
		return
	if not $VBoxContainer/CalzonesLeftLabel.visible:
		$VBoxContainer/CalzonesLeftLabel.text = $VBoxContainer/CalzonesLeftLabel.text + " " + str(calzones)
		$VBoxContainer/CalzonesLeftLabel.visible = true
		return
	if not $VBoxContainer/RankLabel.visible:
		$VBoxContainer/RankLabel.text = $VBoxContainer/RankLabel.text + " " + str(RankManager.get())
		$VBoxContainer/RankLabel.visible = true
		return
	if not $VBoxContainer/Continue.visible:
		$VBoxContainer/Continue.visible = true
		accept = true
		return

func _input(event):
	if Input.is_action_pressed("ui_accept") and accept:
		LevelManager.call_deferred('loadLevel')
		queue_free()

func _on_WinScreenTimer_timeout():
	showNext()
extends NinePatchRect

var GameTime = 0.00

func _ready():
	pass

func _on_Timer_timeout():
	GameTime += 0.01
	$TimeElapsed.text = str(GameTime)
	if GameTime == int(GameTime):
		$TimeElapsed.text += ".00"
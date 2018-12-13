extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	BG_Music_Player.stop()
	if not BG_Music_Player2.playing:
		BG_Music_Player2.play()
	pass

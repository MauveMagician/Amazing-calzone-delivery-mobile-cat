extends Node

onready var texts = ["As the CAT finished all the deliveries, the witching hour approached. Something special was bound to happen, it is the witching hour after all.", "The phone is ringing! A new order! The CALZONES are so good the denizens of places near and far want to have a taste of the rainbow!", "Five calzones. To a place no other CAT has ever been. To the lowest circles of the underworld. The magician needed to check for a route, that really is very far from the city.", "While the cat is confident, everybody knows sometimes it is good to rest, if the trip to hell turns out to be too difficult, it is perfectly fine to turn back."]
var textindex = 0
var finale = false

func _ready():
	$Images.get_child(textindex).visible = true
	$Control/NinePatchRect/Label.text = texts[textindex]

func _on_TextTick_timeout():
	if $Control/NinePatchRect/Label.percent_visible < 1.0:
		$Control/NinePatchRect/Label.visible_characters += 1
	else:
		if textindex == 3:
			finale = true
		$TextTick.stop()

func _input(event):
	if Input.is_action_just_pressed("ui_accept"):
		if finale:
			get_tree().change_scene("res://scene/Hell.tscn")
			queue_free()
		if $Control/NinePatchRect/Label.percent_visible < 1.0:
			$Control/NinePatchRect/Label.percent_visible = 1.0
		else:
			$TextTick.start()
			if textindex < 3:
				$Images.get_child(textindex).visible = false
				textindex += 1
				$Images.get_child(textindex).visible = true
				$Control/NinePatchRect/Label.text = texts[textindex]
				$Control/NinePatchRect/Label.percent_visible = 0
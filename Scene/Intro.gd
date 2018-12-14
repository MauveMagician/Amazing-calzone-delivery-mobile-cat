extends Node

onready var texts = ["In a city not far away, a magician was creating something fabulous...", "THE SAUCE! This powerful concoction could make anything taste like rainbows, it is a bit VOLATILE but the people really like it! The magician was delighted to create something that made people so happy!", "The magician started using THE SAUCE to make CALZONES, the calzones were incredibly delicious, people really wanted a taste of the POWERFUL CALZONES for every meal.", "The people wanted AMAZING CALZONES, and they wanted them immediately! Only a single creature in the world could possilby deliver so many CALZONES so fast."]
var textindex = 0
var finale = false

func _ready():
	$Images.get_child(textindex).visible = true
	$Control/NinePatchRect/Label.text = texts[textindex]

func _on_TextTick_timeout():
	if $Control/NinePatchRect/Label.percent_visible < 1.0:
		$Control/NinePatchRect/Label.visible_characters += 1
	else:
		$TextTick.stop()

func _input(event):
	if finale:
		if $CatTick.is_stopped():
			if Input.is_action_just_pressed("ui_accept"):
				get_tree().change_scene("res://scene/StartScreen.tscn")
				queue_free()
	if Input.is_action_just_pressed("ui_accept"):
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
			if textindex == 3:
				$CatTick.start()
				finale = true

func _on_CatTick_timeout():
	if(textindex <= 4):
		$Images.get_child(textindex).visible = false
		textindex += 1
		$Images.get_child(textindex).visible = true
	else:
		$CatTick.stop()
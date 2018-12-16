extends Node

onready var texts = ["Even through the fires of hell, you and the CAT persevered. Through skill and effort, you and the CAT have forged an eternal bond of memory. We thank you for playing and hope you had a lot of fun! Design and programming by Dis@mauvemagician. Sound, music and drawings by mofumofu. This is a work of fiction. Names, characters, businesses, places, events, locales, and incidents are used in a fictitious manner. Any resemblance to actual persons, living or dead, or actual events is purely coincidental."]
var textindex = 0
var finale = false

func _ready():
	$Control/NinePatchRect/Label.text = texts[textindex]

func _on_TextTick_timeout():
	if $Control/NinePatchRect/Label.percent_visible < 1.0:
		$Control/NinePatchRect/Label.visible_characters += 1
	else:
		finale = true
		$TextTick.stop()
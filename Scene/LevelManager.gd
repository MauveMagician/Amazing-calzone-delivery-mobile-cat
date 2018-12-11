extends Node

onready var levels = ["res://scene/TestStage.tscn", "res://scene/TestStage.tscn"]
var trackNo = 0

func setTrack(index):
	trackNo = index

func loadLevel():
	get_tree().change_scene(levels[trackNo])

func appendLevel():
	trackNo += 1
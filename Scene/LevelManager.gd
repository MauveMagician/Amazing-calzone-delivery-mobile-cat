extends Node

onready var levels = ["res://scene/Stage1.tscn", "res://scene/Stage2.tscn", "res://scene/Stage3.tscn"]
var trackNo = 0

func setTrack(index):
	trackNo = index

func loadLevel():
	get_tree().change_scene(levels[trackNo])

func appendLevel():
	trackNo += 1
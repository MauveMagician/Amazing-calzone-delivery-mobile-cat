extends Node

onready var levels = ["res://scene/Stage1.tscn", "res://scene/Stage2.tscn", "res://scene/Stage3.tscn", "res://scene/Stage4.tscn", "res://scene/Ending1.tscn"]
var trackNo = 0
var hell = false

func setTrack(index):
	trackNo = index

func loadLevel():
	if hell:
		get_tree().change_scene("res://scene/Hell.tscn")
		return
	if trackNo < 4:
		get_tree().change_scene(levels[trackNo])
	else:
		var ranks = RankManager.getStageRanks()
		for i in ranks:
			if(i != "A"):
				get_tree().change_scene("res://scene/Ending1.tscn")
				queue_free()
				return
		hell = true
		get_tree().change_scene("res://scene/Hell.tscn")

func appendLevel():
	trackNo += 1
extends Node2D

export var CurrentRank = "n/a"
onready var StageRanks = ["n/a", "n/a", "n/a", "n/a", "n/a"]
var calzones = 5

func get():
	return CurrentRank

func setRank(calzoneNumber=0, time=0):
	if(LevelManager.trackNo == 0):
		if calzoneNumber >= 5 and time < 8:
			CurrentRank = "A"
		elif calzoneNumber >= 4 and time < 12:
			CurrentRank = "B"
		elif calzoneNumber >= 3 and time < 16:
			CurrentRank = "C"
		else:
			CurrentRank = "D"
		StageRanks[0] = CurrentRank
	elif(LevelManager.trackNo == 1):
		if calzoneNumber >= 5 and time < 20:
			CurrentRank = "A"
		elif calzoneNumber >= 4 and time < 40:
			CurrentRank = "B"
		elif calzoneNumber >= 3 and time < 60:
			CurrentRank = "C"
		else:
			CurrentRank = "D"
		StageRanks[1] = CurrentRank
extends Node2D

export var CurrentRank = "n/a"
onready var StageRanks = ["n/a", "n/a", "n/a", "n/a"]
var calzones = 5

func getStageRanks():
	return StageRanks

func get():
	return CurrentRank

func better(current, new):
	if new == "n/a":
		return true
	if current == "A":
		current = 4
	elif current == "B":
		current = 3
	elif current == "C":
		current = 2
	elif current == "D":
		current = 1
	if new == "A":
		new = 4
	elif new == "B":
		new = 3
	elif new == "C":
		new = 2
	elif new == "D":
		new = 1
	if int(current) > int(new):
		return false
	else:
		return true

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
		if better(StageRanks[0], CurrentRank):
			StageRanks[0] = CurrentRank
	elif(LevelManager.trackNo == 1):
		if calzoneNumber >= 5 and time < 25:
			CurrentRank = "A"
		elif calzoneNumber >= 4 and time < 40:
			CurrentRank = "B"
		elif calzoneNumber >= 3 and time < 60:
			CurrentRank = "C"
		else:
			CurrentRank = "D"
		if better(StageRanks[1], CurrentRank):
			StageRanks[1] = CurrentRank
	elif(LevelManager.trackNo == 2):
		if calzoneNumber >= 5 and time < 35:
			CurrentRank = "A"
		elif calzoneNumber >= 4 and time < 65:
			CurrentRank = "B"
		elif calzoneNumber >= 3 and time < 75:
			CurrentRank = "C"
		else:
			CurrentRank = "D"
		if better(StageRanks[2], CurrentRank):
			StageRanks[2] = CurrentRank
	elif(LevelManager.trackNo == 3):
		if calzoneNumber >= 5 and time < 35:
			CurrentRank = "A"
		elif calzoneNumber >= 4 and time < 65:
			CurrentRank = "B"
		elif calzoneNumber >= 3 and time < 75:
			CurrentRank = "C"
		else:
			CurrentRank = "D"
		if better(StageRanks[3], CurrentRank):
			StageRanks[3] = CurrentRank
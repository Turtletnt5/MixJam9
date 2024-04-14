extends Node

@export var killsNeeded : int = 6
@export var infiniteMode : bool = false

var KillCount : int = 0


signal WaveKilled()

func killedEnemy():
	KillCount += 1
	
	if KillCount >= killsNeeded:
		
		if !infiniteMode:
			await get_tree().create_timer(3).timeout
			get_tree().change_scene_to_file("res://MyStuff/Menus/Basic/BasicWin.tscn")
		else:
			await get_tree().create_timer(1).timeout
			KillCount = 0
			InfiniteGlobals.waveCount += 1
			WaveKilled.emit()
	

func MisstionFailed():
	
	if !infiniteMode:
		get_tree().change_scene_to_file("res://MyStuff/Menus/Basic/BasicLose.tscn")
		
	else:
		get_tree().call_group("Skeletons", "suicide")
		get_tree().change_scene_to_file("res://MyStuff/Menus/Infinite/InfiniteScore.tscn")

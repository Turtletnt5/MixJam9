extends Node

@export var killsNeeded : int = 6
@export var infiniteMode : bool = false

var KillCount : int = 0

func killedEnemy():
	KillCount += 1
	
	if KillCount >= killsNeeded:
		
		if !infiniteMode:
			await get_tree().create_timer(3).timeout
			get_tree().change_scene_to_file("res://MyStuff/Menus/Basic/BasicWin.tscn")
		else:
			pass
	

extends Node

signal SpawnEnemy(Life)

var wave : int = 0

func _ready():
	await get_tree().create_timer(1).timeout
	NextWave()
	InfiniteGlobals.waveCount = 0


func NextWave():
	wave += 1
	SpawnEnemy.emit(wave)

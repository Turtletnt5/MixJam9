extends Node2D

var skeleton = preload("res://MyStuff/Enemies/skeleton.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func spawnEnemey(Life):
	var s = skeleton.instantiate()
	s.start(position)
	s.setLife(Life)
	get_tree().root.add_child.call_deferred(s)
	

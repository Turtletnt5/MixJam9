extends Control

@onready var label = $Label

# Called when the node enters the scene tree for the first time.
func _ready():
	label.text = "You Survived \n" + str(InfiniteGlobals.waveCount) + " Waves"
	$WinSound.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_restart_pressed():
	InfiniteGlobals.waveCount = 0
	get_tree().change_scene_to_file("res://MyStuff/Infinite mode/Infinite_level.tscn")
	


func _on_menu_pressed():
	InfiniteGlobals.waveCount = 0
	get_tree().change_scene_to_file("res://MyStuff/Menus/Start/start_menu.tscn")

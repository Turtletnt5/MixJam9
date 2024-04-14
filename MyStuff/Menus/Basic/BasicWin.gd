extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$WinSound.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_restart_pressed():
	get_tree().change_scene_to_file("res://MyStuff/Classic mode/classic_level.tscn")


func _on_menu_pressed():
	get_tree().change_scene_to_file("res://MyStuff/Menus/Start/start_menu.tscn")

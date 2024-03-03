extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(_event):
	if Input.is_action_just_pressed("ui_end"):
		var pause_menu_scene = load("res://Menus/PauseMenu/pause_menu.tscn")
		var pause_menu_instance = pause_menu_scene.instantiate()
		$PauseMenu.add_child(pause_menu_instance)
		get_tree().paused = true

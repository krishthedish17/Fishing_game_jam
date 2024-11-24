extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	SettingsManager.load_config()
	$Label.visible = false
	$Button.visible = false
	$AnimatedSprite2D.play("default")
	await get_tree().create_timer(3.8).timeout
	$Label.visible = true
	$Button.visible = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	get_tree().change_scene_to_file("res://Menus/MainMenu/main_menu.tscn")

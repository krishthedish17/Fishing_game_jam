extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	self.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if GlobalVariables.failed == true:
		self.visible = true
		$Label.text = GlobalVariables.failed_text


func _on_button_pressed():
	get_tree().change_scene_to_file("res://start_of_game.tscn")
	self.visible = false
	GlobalVariables.failed = false

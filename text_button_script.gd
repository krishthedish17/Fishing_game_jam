extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$start_timer.start(3)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	hide_buttons()
	if GlobalVariables.text_question == 1:
		$Button.text = "Be casual"
		$Button2.text = "Be direct"
		$Button3.text = "Make a joke"
		$Button4.text = "Be mysterious"
	elif GlobalVariables.text_question == 2:
		$Button.text = "no"
		$Button2.text = "yes"
		$Button3.text = "fuck"
		$Button4.text = "sex"
	elif GlobalVariables.text_question == 3:
		$Button.text = "Be casual"
		$Button2.text = "Be direct"
		$Button3.text = "Make a joke"
		$Button4.text = "Be mysterious"
	elif GlobalVariables.text_question == 4:
		$Button.text = "Be casual"
		$Button2.text = "Be direct"
		$Button3.text = "Make a joke"
		$Button4.text = "Be mysterious"
	elif GlobalVariables.text_question == 5:
		$Button.text = "Be casual"
		$Button2.text = "Be direct"
		$Button3.text = "Make a joke"
		$Button4.text = "Be mysterious"

func _on_option_1_pressed():
	if GlobalVariables.text_question == 1:
		GlobalVariables.action_picked = true
	GlobalVariables.text_question += 1


func _on_option_2_pressed():
	if GlobalVariables.text_question == 1:
		GlobalVariables.failed_text = "Did you seriously think that would work"
		GlobalVariables.action_picked = true
		$wait_timer.start(3)
	GlobalVariables.text_question += 1

func _on_button_3_pressed():
	if GlobalVariables.text_question == 1:
		GlobalVariables.action_picked = true
	GlobalVariables.text_question += 1


func _on_button_4_pressed():
	if GlobalVariables.text_question == 1:
		GlobalVariables.action_picked = true
	GlobalVariables.text_question += 1

func hide_buttons():
	if GlobalVariables.action_picked == true:
		$Button.visible = false
		$Button2.visible = false
		$Button3.visible = false
		$Button4.visible = false
	else:
		$Button.visible = true
		$Button2.visible = true
		$Button3.visible = true
		$Button4.visible = true

func _on_wait_timer_timeout():
	GlobalVariables.failed = true


func _on_start_timer_timeout():
	GlobalVariables.action_picked = false

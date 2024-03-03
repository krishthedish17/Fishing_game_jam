extends Node2D

var correct: int = 0
var pressed: int = 0 
# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.play("default")
	$messages/Sprite2D.visible = false
	$messages/Label2.visible = false
	$messages/Sprite2D2.visible = false
	$messages/Label.visible = false
	$messages/Sprite2D3.visible = false
	$messages/Label3.visible = false
	$messages/Sprite2D4.visible = false
	$messages/Label4.visible = false
	$messages/ColorRect.visible = false
	$messages/Sprite2D5.visible = false
	$messages/Label5.visible = false
	$messages/ColorRect2.visible = false
	GlobalVariables.action_picked = true
	await get_tree().create_timer(3.0).timeout
	GlobalVariables.action_picked = false
	correct = 0
	if GlobalVariables.text_question == 2:
		$messages/Sprite2D.visible = true
		$messages/Label2.visible = true
		$messages/Sprite2D2.visible = true
		$messages/Label.visible = true
		$messages/Label.text = "Hey"
		$messages/Label2.text = "Hey"
	if GlobalVariables.text_question == 3:
		$messages/Sprite2D.visible = true
		$messages/Label2.visible = true
		$messages/Sprite2D2.visible = true
		$messages/Label.visible = true
		$messages/Label.text = "Hey"
		$messages/Label2.text = "Hey"
		$messages/Sprite2D3.visible = true
		$messages/Label3.visible = true
		$messages/Sprite2D4.visible = true
		$messages/Label4.visible = true
		$messages/ColorRect.visible = true
		$messages/Sprite2D5.visible = true
		$messages/Label5.visible = true
		$messages/Label3.text = "Can you send a picture?"
		$messages/Label5.text = "Oh"
	if GlobalVariables.text_question == 4:
		$messages/Sprite2D.visible = true
		$messages/Label2.visible = true
		$messages/Label2.text = "can I see u?"
		$messages/ColorRect2.visible = true
	GlobalVariables.action_picked = false
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	hide_buttons()
	if GlobalVariables.text_question == 1:
		$Button.text = "Be casual"
		$Button2.text = "Be direct"
		$Button3.text = "Make a joke"
		$Button4.text = "Be mysterious"
	elif GlobalVariables.text_question == 2:
		print("2nd question")
		$Button.text = "Ask about his 
		interests"
		$Button2.text = "Ask about his job"
		$Button3.text = "Make a joke"
		$Button4.text = "Wait"
	elif GlobalVariables.text_question == 3:
		$Button.text = "Friendzone"
		$Button2.text = "Tell him a secret"
		$Button3.text = "Make a joke"
		$Button4.text = "Ask for his picture"
	elif GlobalVariables.text_question == 4:
		$Button.text = "Call him bald"
		$Button2.text = "Ask if he can call"
		$Button3.text = "Make a joke"
		$Button4.text = "Try to arrest him"

func _on_option_1_pressed():
	pressed += 1
	if GlobalVariables.text_question == 1:
		GlobalVariables.action_picked = true
		GlobalVariables.action_picked = true
		correct += 1
		$wait_timer.start(3)
		await get_tree().create_timer(1.0).timeout
		$messages/Label2.text = "Hey"
		$messages/Sprite2D.visible = true
		$messages/Label2.visible = true
		await get_tree().create_timer(1.0).timeout
		$messages/Label.text = "Hey"
		$messages/Sprite2D2.visible = true
		$messages/Label.visible = true
		GlobalVariables.text_question += 1
	if GlobalVariables.text_question == 2 && pressed == 2:
		GlobalVariables.failed_text = "He proceeded to talk for the next 3 hours"
		GlobalVariables.action_picked = true
		$wait_timer.start(3)
		await get_tree().create_timer(1.0).timeout
		$messages/Label3.text = "What do you like?"
		$messages/Sprite2D3.visible = true
		$messages/Label3.visible = true
		await get_tree().create_timer(1.0).timeout
		$messages/Label4.text = "Well, to begin..."
		$messages/Sprite2D4.visible = true
		$messages/Label4.visible = true
	if GlobalVariables.text_question == 3 && pressed == 3:
		GlobalVariables.failed_text = "why did u think that would work"
		GlobalVariables.action_picked = true
		$wait_timer.start(3)
		await get_tree().create_timer(1.0).timeout
		$messages/Sprite2D2.visible = false
		$messages/Label.visible = false
		$messages/Sprite2D3.visible = false
		$messages/Label3.visible = false
		$messages/Sprite2D4.visible = false
		$messages/Label4.visible = false
		$messages/ColorRect.visible = false
		$messages/Sprite2D5.visible = false
		$messages/Label5.visible = false
		$messages/Label2.text = "U seem like a
		good friend"
		$messages/Sprite2D.visible = true
		$messages/Label2.visible = true
		await get_tree().create_timer(1.0).timeout
		$messages/Label.text = "srsly? ur blocked"
		$messages/Sprite2D2.visible = true
		$messages/Label.visible = true
	if GlobalVariables.text_question == 4 && pressed == 4:
		GlobalVariables.failed_text = "that was kinda rude ngl"
		GlobalVariables.action_picked = true
		$wait_timer.start(3)
		await get_tree().create_timer(1.0).timeout
		$messages/Label3.text = "ur bald and ugly"
		$messages/Sprite2D3.visible = true
		$messages/Label3.visible = true
		await get_tree().create_timer(1.0).timeout
		$messages/Label4.text = ":("
		$messages/Sprite2D4.visible = true
		$messages/Label4.visible = true
	
	


func _on_option_2_pressed():
	pressed += 1
	if GlobalVariables.text_question == 1:
		GlobalVariables.failed_text = "Did you seriously think that would work"
		GlobalVariables.action_picked = true
		$wait_timer.start(3)
		await get_tree().create_timer(1.0).timeout
		$messages/Label2.text = "U smuggle?"
		$messages/Sprite2D.visible = true
		$messages/Label2.visible = true
		await get_tree().create_timer(1.0).timeout
		$messages/Label.text = "Blocked"
		$messages/Sprite2D2.visible = true
		$messages/Label.visible = true
	if GlobalVariables.text_question == 2 && pressed == 2:
		GlobalVariables.failed_text = "He's not that stupid"
		GlobalVariables.action_picked = true
		$wait_timer.start(3)
		await get_tree().create_timer(1.0).timeout
		$messages/Label3.text = "Do you dabble in
		water sales?"
		$messages/Sprite2D3.visible = true
		$messages/Label3.visible = true
		await get_tree().create_timer(1.0).timeout
		$messages/Label4.text = "what"
		$messages/Sprite2D4.visible = true
		$messages/Label4.visible = true
	if GlobalVariables.text_question == 3 && pressed == 3:
		GlobalVariables.failed_text = "guess he didnt care"
		GlobalVariables.action_picked = true
		$wait_timer.start(3)
		await get_tree().create_timer(1.0).timeout
		$messages/Sprite2D2.visible = false
		$messages/Label.visible = false
		$messages/Sprite2D3.visible = false
		$messages/Label3.visible = false
		$messages/Sprite2D4.visible = false
		$messages/Label4.visible = false
		$messages/ColorRect.visible = false
		$messages/Sprite2D5.visible = false
		$messages/Label5.visible = false
		$messages/Label2.text = "u wanna know smth cool?"
		$messages/Sprite2D.visible = true
		$messages/Label2.visible = true
		await get_tree().create_timer(1.0).timeout
		$messages/Label.text = "rot really?"
		$messages/Sprite2D2.visible = true
		$messages/Label.visible = true
	if GlobalVariables.text_question == 4 && pressed == 4:
		correct += 1
		GlobalVariables.action_picked = true
		$wait_timer.start(3)
		await get_tree().create_timer(1.0).timeout
		$messages/Label3.text = "u wanna call?"
		$messages/Sprite2D3.visible = true
		$messages/Label3.visible = true
		await get_tree().create_timer(1.0).timeout
		$messages/Label4.text = "sure ;) "
		$messages/Sprite2D4.visible = true
		$messages/Label4.visible = true

func _on_button_3_pressed():
	pressed += 1
	if GlobalVariables.text_question == 1:
		GlobalVariables.failed_text = "I don't think he found it funny"
		GlobalVariables.action_picked = true
		$wait_timer.start(3)
		await get_tree().create_timer(1.0).timeout
		$messages/Label2.text = "Ya like jazz?"
		$messages/Sprite2D.visible = true
		$messages/Label2.visible = true
		await get_tree().create_timer(1.0).timeout
		$messages/Label.text = "I hate jazz"
		$messages/Sprite2D2.visible = true
		$messages/Label.visible = true
	if GlobalVariables.text_question == 2:
		GlobalVariables.failed_text = "I don't think he found it funny"
		GlobalVariables.action_picked = true
		$wait_timer.start(3)
		await get_tree().create_timer(1.0).timeout
		$messages/Label3.text = "Ya like jazz?"
		$messages/Sprite2D3.visible = true
		$messages/Label3.visible = true
		await get_tree().create_timer(1.0).timeout
		$messages/Label4.text = "I hate jazz"
		$messages/Sprite2D4.visible = true
		$messages/Label4.visible = true
	if GlobalVariables.text_question == 3 && pressed == 3:
		GlobalVariables.failed_text = "dont think he watched the movie"
		GlobalVariables.action_picked = true
		$wait_timer.start(3)
		await get_tree().create_timer(1.0).timeout
		$messages/Sprite2D2.visible = false
		$messages/Label.visible = false
		$messages/Sprite2D3.visible = false
		$messages/Label3.visible = false
		$messages/Sprite2D4.visible = false
		$messages/Label4.visible = false
		$messages/ColorRect.visible = false
		$messages/Sprite2D5.visible = false
		$messages/Label5.visible = false
		$messages/Label2.text = "Ya like Jazz?"
		$messages/Sprite2D.visible = true
		$messages/Label2.visible = true
		await get_tree().create_timer(1.0).timeout
		$messages/Label.text = "really?"
		$messages/Sprite2D2.visible = true
		$messages/Label.visible = true
	if GlobalVariables.text_question == 4 && pressed == 4:
		GlobalVariables.failed_text = "just stop trying"
		GlobalVariables.action_picked = true
		$wait_timer.start(3)
		await get_tree().create_timer(1.0).timeout
		$messages/Label3.text = "Ya like jazz?"
		$messages/Sprite2D3.visible = true
		$messages/Label3.visible = true
		await get_tree().create_timer(1.0).timeout
		$messages/Label4.text = "no"
		$messages/Sprite2D4.visible = true
		$messages/Label4.visible = true


func _on_button_4_pressed():
	pressed += 1
	if GlobalVariables.text_question == 1:
		GlobalVariables.failed_text = "Works for batman, not for you"
		GlobalVariables.action_picked = true
		$wait_timer.start(3)
		await get_tree().create_timer(1.0).timeout
		$messages/Label2.text = "All is said
in the silence"
		$messages/Sprite2D.visible = true
		$messages/Label2.visible = true
		await get_tree().create_timer(1.0).timeout
		$messages/Label.text = "what"
		$messages/Sprite2D2.visible = true
		$messages/Label.visible = true
	if GlobalVariables.text_question == 2:
		GlobalVariables.action_picked = true
		GlobalVariables.action_picked = true
		correct += 1
		$wait_timer.start(4)
		await get_tree().create_timer(1.0).timeout
		$messages/Label4.text = "Can u send 
		a picture?"
		$messages/Sprite2D4.visible = true
		$messages/Label4.visible = true
		await get_tree().create_timer(1.0).timeout
		$messages/ColorRect.visible = true
		GlobalVariables.text_question += 1
		await get_tree().create_timer(1.0).timeout
		$messages/Sprite2D5.visible = true
		$messages/Label5.visible = true
	if GlobalVariables.text_question == 3 && pressed == 3:
		GlobalVariables.failed_text = "option d"
		GlobalVariables.action_picked = true
		correct += 1
		$wait_timer.start(3)
		await get_tree().create_timer(1.0).timeout
		$messages/Sprite2D2.visible = false
		$messages/Label.visible = false
		$messages/Sprite2D3.visible = false
		$messages/Label3.visible = false
		$messages/Sprite2D4.visible = false
		$messages/Label4.visible = false
		$messages/ColorRect.visible = false
		$messages/Sprite2D5.visible = false
		$messages/Label5.visible = false
		$messages/Label2.text = "can I see u?"
		$messages/Sprite2D.visible = true
		$messages/Label2.visible = true
		await get_tree().create_timer(1.0).timeout
		$messages/ColorRect2.visible = true
		GlobalVariables.text_question += 1
	if GlobalVariables.text_question == 4 && pressed == 4:
		GlobalVariables.failed_text = "ur not slick"
		GlobalVariables.action_picked = true
		$wait_timer.start(3)
		await get_tree().create_timer(1.0).timeout
		$messages/Label3.text = "are u a criminal?"
		$messages/Sprite2D3.visible = true
		$messages/Label3.visible = true
		await get_tree().create_timer(1.0).timeout
		$messages/Label4.text = "blocked ^ 2"
		$messages/Sprite2D4.visible = true
		$messages/Label4.visible = true
	

func hide_buttons():
	if GlobalVariables.action_picked == true or GlobalVariables.failed == true:
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
	print(correct)
	if GlobalVariables.text_question == 1 && correct < 1:
		GlobalVariables.failed = true
		print("lost 1")
	else:
		GlobalVariables.action_picked = false
	if GlobalVariables.text_question == 2 && correct < 2 && pressed == 2:
		GlobalVariables.failed = true
		print("lost 2")
	else:
		GlobalVariables.action_picked = false
	if GlobalVariables.text_question == 3 && correct < 3 && pressed == 3:
		GlobalVariables.failed = true
		print("lost 2")
	else:
		GlobalVariables.action_picked = false
	if GlobalVariables.text_question == 4 && correct < 4 && pressed == 4:
		GlobalVariables.failed = true
		print("lost 2")
	else:
		GlobalVariables.action_picked = false

func _input(_event):
	if Input.is_action_just_pressed("ui_end"):
		var pause_menu_scene = load("res://Menus/PauseMenu/pause_menu.tscn")
		var pause_menu_instance = pause_menu_scene.instantiate()
		$PauseMenu.add_child(pause_menu_instance)
		get_tree().paused = true

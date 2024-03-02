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
	GlobalVariables.text_question = 1
	await get_tree().create_timer(3.0).timeout
	correct = 0
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
		$Button3.text = "Ask to call"
		$Button4.text = "Make a joke"
	elif GlobalVariables.text_question == 3:
		$Button.text = "Pretend to care"
		$Button2.text = "Call him stupid"
		$Button3.text = "Make a joke"
		$Button4.text = "Ask about his career"
	elif GlobalVariables.text_question == 4:
		$Button.text = "Call him bald"
		$Button2.text = "Try to arrest him"
		$Button3.text = "Make a joke"
		$Button4.text = "Ask if he can call"

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
	
	


func _on_option_2_pressed():
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

func _on_button_3_pressed():
	if GlobalVariables.text_question == 1:
		GlobalVariables.failed_text = "I don't think he found it funny"
		GlobalVariables.action_picked = true
		$wait_timer.start(3)
		await get_tree().create_timer(1.0).timeout
		$messages/Label2.text = "Ya like jazz?"
		$messages/Sprite2D.visible = true
		$messages/Label2.visible = true
		await get_tree().create_timer(1.0).timeout
		$messages/Label.text = "Not funny"
		$messages/Sprite2D2.visible = true
		$messages/Label.visible = true


func _on_button_4_pressed():
	if GlobalVariables.text_question == 1:
		GlobalVariables.failed_text = "Works for batman, not for you"
		GlobalVariables.action_picked = true
		$wait_timer.start(3)
		await get_tree().create_timer(1.0).timeout
		$messages/Label2.text = "Who am I?"
		$messages/Sprite2D.visible = true
		$messages/Label2.visible = true
		await get_tree().create_timer(1.0).timeout
		$messages/Label.text = "Idk"
		$messages/Sprite2D2.visible = true
		$messages/Label.visible = true

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

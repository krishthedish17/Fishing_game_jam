extends Node2D

var correct: int = 0
var pressed: int = 0 
var girl_talking: bool = false
var boy_talking: bool = false
var ending = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	GlobalVariables.game_active = true
	SettingsManager.load_config()
	if GlobalVariables.text_question < 5:
		GlobalVariables.text_question = 5
	correct = GlobalVariables.text_question - 1
	pressed = 4
	GlobalVariables.action_picked = false
	correct = 0
	$Sprite2D.visible = false
	$Sprite2D2.visible = false
	$Label.visible = false
	var girl_talking: bool = false
	var boy_talking: bool = false
	GlobalVariables.action_picked = false
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	hide_buttons()
	speech()
	if SettingsManager.voices_volume != 0:
		$male.volume_db = SettingsManager.voices_volume * 2
		$female.volume_db = SettingsManager.voices_volume * 2
	else:
		$male.volume_db = -100
		$female.volume_db = -100
	if GlobalVariables.text_question == 10:
		correct = 10
	if ending != 0:
		GlobalVariables.action_picked = true
	if GlobalVariables.text_question == 5:
		$Button.text = "Guilt?"
		$Button2.text = "Scare?"
		$Button3.text = "Joke?"
		$Button4.text = "Play?"
	elif GlobalVariables.text_question == 6:
		$Button.text = "Pity?"
		$Button2.text = "Lie?"
		$Button3.text = "Joke?"
		$Button4.text = "Preach?"
	elif GlobalVariables.text_question == 7:
		$Button.text = "Pry?"
		$Button2.text = "Value?"
		$Button3.text = "Joke?"
		$Button4.text = "Meet?"
	elif GlobalVariables.text_question == 8:
		$Button.text = "Accept?"
		$Button2.text = "Act?"
		$Button3.text = "Joke?"
		$Button4.text = "Wait"
	elif GlobalVariables.text_question == 9:
		$Button.text = "Sneak?"
		$Button2.text = "Pressure?"
		$Button3.text = "Joke?"
		$Button4.text = "Guilt?"
	elif GlobalVariables.text_question == 10:
		$Button.text = "Truth?"
		$Button2.text = "Act?"
		$Button3.text = "Joke?"
		$Button4.text = "Wait"

func _on_option_1_pressed():
	pressed += 1
	if GlobalVariables.text_question == 5:
		GlobalVariables.action_picked = true
		GlobalVariables.action_picked = true
		correct += 1
		$wait_timer.start(4)
		await get_tree().create_timer(0.5).timeout
		$Label.text = "I'm feeling kinda sad right now"
		$Sprite2D.visible = true
		$Label.visible = true
		girl_talking= true
		$female.play()
		await get_tree().create_timer(2.0).timeout
		$female.stop()
		$male.play()
		$Sprite2D.visible = false
		$Sprite2D2.visible = true
		girl_talking= false
		boy_talking = true
		$Label.text = "Are you ok?"
		GlobalVariables.text_question += 1
	if GlobalVariables.text_question == 6 && pressed == 6:
		GlobalVariables.failed_text = "You disappointed him, and failed, 
		what did you achieve?"
		GlobalVariables.action_picked = true
		GlobalVariables.action_picked = true
		$wait_timer.start(3)
		await get_tree().create_timer(0.5).timeout
		$Sprite2D2.visible = false
		$Label.text = "I feel bad for lying to you"
		$Sprite2D.visible = true
		$Label.visible = true
		girl_talking= true
		$female.play()
		await get_tree().create_timer(1.5).timeout
		$female.stop()
		$male.play()
		$Sprite2D.visible = false
		$Sprite2D2.visible = true
		girl_talking= false
		boy_talking = true
		$Label.text = "WHAT"
	if GlobalVariables.text_question == 7 && pressed == 7:
		GlobalVariables.action_picked = true
		GlobalVariables.action_picked = true
		correct += 1
		correct = 7
		pressed = 7
		print(correct)
		print(GlobalVariables.text_question)
		print(pressed)
		$wait_timer.start(5)
		await get_tree().create_timer(0.5).timeout
		$Sprite2D2.visible = false
		$Label.text = "I just really need something to cheer me up"
		$Sprite2D.visible = true
		$Label.visible = true
		girl_talking= true
		$female.play()
		await get_tree().create_timer(2.5).timeout
		$female.stop()
		$male.play()
		$Sprite2D.visible = false
		$Sprite2D2.visible = true
		girl_talking= false
		boy_talking = true
		$Label.text = "Maybe I can help"
		GlobalVariables.text_question += 1
		print("next question" +str(GlobalVariables.text_question))
	if GlobalVariables.text_question == 8 && pressed == 8:
		GlobalVariables.failed_text = "Think about what you just did, I'll wait"
		GlobalVariables.action_picked = true
		GlobalVariables.action_picked = true
		$wait_timer.start(4)
		await get_tree().create_timer(0.5).timeout
		$Sprite2D2.visible = false
		$Label.text = "Ok I'll take it"
		$Sprite2D.visible = true
		$Label.visible = true
		girl_talking= true
		$female.play()
		await get_tree().create_timer(1.5).timeout
		$female.stop()
		$male.play()
		$Sprite2D.visible = false
		$Sprite2D2.visible = true
		girl_talking= false
		boy_talking = true
		$Label.text = "I didn't even tell you what it was"
	if GlobalVariables.text_question == 9 && pressed == 9:
		correct += 1
		GlobalVariables.action_picked = true
		GlobalVariables.action_picked = true
		$wait_timer.start(5)
		await get_tree().create_timer(0.5).timeout
		$Sprite2D2.visible = false
		$Label.text = "I mean, I guess if you want to"
		$Sprite2D.visible = true
		$Label.visible = true
		girl_talking= true
		$female.play()
		await get_tree().create_timer(2).timeout
		$female.stop()
		$male.play()
		$Sprite2D.visible = false
		$Sprite2D2.visible = true
		girl_talking= false
		boy_talking = true
		$Label.text = "Alright, here's my address if you want to see 
		me: 4212 Burberry Rd"
		GlobalVariables.text_question += 1
	if GlobalVariables.text_question == 10 && pressed == 10:
		ending = 1
		GlobalVariables.action_picked = true
		GlobalVariables.action_picked = true
		$"end timer".start(6)
		await get_tree().create_timer(0.5).timeout
		$Sprite2D2.visible = false
		$Label.text = "Jeff, you see, I catfished you.
		I'm actually a police officer."
		$Sprite2D.visible = true
		$Label.visible = true
		girl_talking= true
		$female.play()
		await get_tree().create_timer(4).timeout
		$female.stop()
		$male.play()
		$Sprite2D.visible = false
		$Sprite2D2.visible = true
		girl_talking= false
		boy_talking = true
		$Label.text = "You did WHAT"
	


func _on_option_2_pressed():
	pressed += 1
	if GlobalVariables.text_question == 5:
		GlobalVariables.failed_text = "Bit too forward of an approach"
		GlobalVariables.action_picked = true
		GlobalVariables.action_picked = true
		$wait_timer.start(4)
		await get_tree().create_timer(0.5).timeout
		$Label.text = "Tell me the truth, you deal don't you?"
		$Sprite2D.visible = true
		$Label.visible = true
		girl_talking= true
		$female.play()
		await get_tree().create_timer(2.0).timeout
		$female.stop()
		$male.play()
		$Sprite2D.visible = false
		$Sprite2D2.visible = true
		$AnimatedSprite2D2.visible = false
		girl_talking= false
		$Label.text = "disconnected from chat room"
	if GlobalVariables.text_question == 6 && pressed == 6:
		GlobalVariables.action_picked = true
		GlobalVariables.action_picked = true
		correct += 1
		$wait_timer.start(5)
		await get_tree().create_timer(0.5).timeout
		$Sprite2D2.visible = false
		$Label.text = "My fish died due to some water dealers"
		$Sprite2D.visible = true
		$Label.visible = true
		girl_talking= true
		$female.play()
		await get_tree().create_timer(2.0).timeout
		$female.stop()
		$male.play()
		$Sprite2D.visible = false
		$Sprite2D2.visible = true
		girl_talking= false
		boy_talking = true
		$Label.text = "Oh my ba- I mean I feel sorry for you"
		GlobalVariables.text_question += 1
	if GlobalVariables.text_question == 7 && pressed == 7:
		GlobalVariables.failed_text = "Clearly you became a police officer
		since you flunked out of acting school"
		GlobalVariables.action_picked = true
		GlobalVariables.action_picked = true
		$wait_timer.start(4)
		await get_tree().create_timer(0.5).timeout
		$Sprite2D2.visible = false
		$Label.text = "I really appreciate you, Jeff"
		$Sprite2D.visible = true
		$Label.visible = true
		girl_talking= true
		$female.play()
		await get_tree().create_timer(2).timeout
		$female.stop()
		$male.play()
		$Sprite2D.visible = false
		$Sprite2D2.visible = true
		girl_talking= false
		boy_talking = true
		$Label.text = "c'mon now..."
	if GlobalVariables.text_question == 8 && pressed == 8:
		correct += 1
		GlobalVariables.action_picked = true
		GlobalVariables.action_picked = true
		$wait_timer.start(4)
		await get_tree().create_timer(0.5).timeout
		$Sprite2D2.visible = false
		$Label.text = "What do you mean, are you talking about..?"
		$Sprite2D.visible = true
		$Label.visible = true
		girl_talking= true
		$female.play()
		await get_tree().create_timer(1.5).timeout
		$female.stop()
		$male.play()
		$Sprite2D.visible = false
		$Sprite2D2.visible = true
		girl_talking= false
		boy_talking = true
		$Label.text = "Maybe, depends on if you want it"
		GlobalVariables.text_question +=1
	if GlobalVariables.text_question == 9 && pressed == 9:
		GlobalVariables.failed_text = "Don't be violent: Quote by Me"
		GlobalVariables.action_picked = true
		GlobalVariables.action_picked = true
		$wait_timer.start(4)
		await get_tree().create_timer(0.5).timeout
		$Sprite2D2.visible = false
		$Label.text = "Tell me where your at. RIGHT NOW"
		$Sprite2D.visible = true
		$Label.visible = true
		girl_talking= true
		$female.play()
		await get_tree().create_timer(2).timeout
		$female.stop()
		$male.play()
		$Sprite2D.visible = false
		$Sprite2D2.visible = true
		girl_talking= false
		boy_talking = true
		$Label.text = "w-w-what?"
	if GlobalVariables.text_question == 10 && pressed == 10:
			ending = 2
			GlobalVariables.action_picked = true
			GlobalVariables.action_picked = true
			$"end timer".start(6)
			await get_tree().create_timer(0.5).timeout
			$Sprite2D2.visible = false
			$Label.text = "Aight Jeff, I'll see you
			later. Good night."
			$Sprite2D.visible = true
			$Label.visible = true
			girl_talking= true
			$female.play()
			await get_tree().create_timer(4).timeout
			$female.stop()
			$male.play()
			$Sprite2D.visible = false
			$Sprite2D2.visible = true
			girl_talking= false
			boy_talking = true
			$Label.text = "Uh ok, goodnight."
func _on_button_3_pressed():
	pressed += 1
	if GlobalVariables.text_question == 5:
		GlobalVariables.failed_text = "It wasn't funny the last 4 times,
		what made you think it would work now?"
		GlobalVariables.action_picked = true
		GlobalVariables.action_picked = true
		correct = 4
		$wait_timer.start(3.5)
		await get_tree().create_timer(0.5).timeout
		$Label.text = "Ya like jazz?"
		$Sprite2D.visible = true
		$Label.visible = true
		girl_talking= true
		$female.play()
		await get_tree().create_timer(1.5).timeout
		$female.stop()
		$male.play()
		$Sprite2D.visible = false
		$Sprite2D2.visible = true
		girl_talking= false
		boy_talking = true
		$Label.text = "I hate jazz"
	if GlobalVariables.text_question == 6:
		GlobalVariables.failed_text = "im not even gonna ask"
		GlobalVariables.action_picked = true
		GlobalVariables.action_picked = true
		correct = 5
		$wait_timer.start(4)
		await get_tree().create_timer(0.5).timeout
		$Sprite2D2.visible = false
		$Label.text = "Ya like jazz?"
		$Sprite2D.visible = true
		$Label.visible = true
		girl_talking= true
		$female.play()
		await get_tree().create_timer(2).timeout
		$female.stop()
		$male.play()
		$Sprite2D.visible = false
		$Sprite2D2.visible = true
		girl_talking= false
		boy_talking = true
		$Label.text = "I hate jazz"
	if GlobalVariables.text_question == 7 && pressed == 7:
		GlobalVariables.failed_text = "it didnt work the first 6 times,
		surely it will work the 7th"
		GlobalVariables.action_picked = true
		GlobalVariables.action_picked = true
		correct = 6
		$wait_timer.start(4)
		await get_tree().create_timer(0.5).timeout
		$Sprite2D2.visible = false
		$Label.text = "Ya like jazz?"
		$Sprite2D.visible = true
		$Label.visible = true
		girl_talking= true
		$female.play()
		await get_tree().create_timer(2).timeout
		$female.stop()
		$male.play()
		$Sprite2D.visible = false
		$Sprite2D2.visible = true
		girl_talking= false
		boy_talking = true
		$Label.text = "I hate jazz"
	if GlobalVariables.text_question == 8 && pressed == 8:
		GlobalVariables.failed_text = "atleast your happy"
		GlobalVariables.action_picked = true
		GlobalVariables.action_picked = true
		correct = 7
		$wait_timer.start(4)
		await get_tree().create_timer(0.5).timeout
		$Sprite2D2.visible = false
		$Label.text = "Ya like jazz?"
		$Sprite2D.visible = true
		$Label.visible = true
		girl_talking= true
		$female.play()
		await get_tree().create_timer(2).timeout
		$female.stop()
		$male.play()
		$Sprite2D.visible = false
		$Sprite2D2.visible = true
		girl_talking= false
		boy_talking = true
		$Label.text = "I hate jazz"
	if GlobalVariables.text_question == 9 && pressed == 9:
		GlobalVariables.failed_text = "atleast your happy"
		GlobalVariables.action_picked = true
		GlobalVariables.action_picked = true
		correct = 8
		$wait_timer.start(4)
		await get_tree().create_timer(0.5).timeout
		$Sprite2D2.visible = false
		$Label.text = "Ya like jazz?"
		$Sprite2D.visible = true
		$Label.visible = true
		girl_talking= true
		$female.play()
		await get_tree().create_timer(2).timeout
		$female.stop()
		$male.play()
		$Sprite2D.visible = false
		$Sprite2D2.visible = true
		girl_talking= false
		boy_talking = true
		$Label.text = "I hate jazz"
	if GlobalVariables.text_question == 10 && pressed == 10:
			ending = 3
			GlobalVariables.action_picked = true
			GlobalVariables.action_picked = true
			$"end timer".start(6)
			await get_tree().create_timer(0.5).timeout
			$Sprite2D2.visible = false
			$Label.text = "Jeff, wanna see something funny? Open the
			window. Hope you like jazz."
			$Sprite2D.visible = true
			$Label.visible = true
			girl_talking= true
			$female.play()
			await get_tree().create_timer(4).timeout
			$female.stop()
			$male.play()
			$Sprite2D.visible = false
			$Sprite2D2.visible = true
			girl_talking= false
			boy_talking = true
			$Label.text = "what?"

func _on_button_4_pressed():
	pressed += 1
	if GlobalVariables.text_question == 5:
		GlobalVariables.failed_text = "Don't think he was 'playing' around"
		GlobalVariables.action_picked = true
		GlobalVariables.action_picked = true
		$wait_timer.start(6)
		await get_tree().create_timer(0.5).timeout
		$Label.text = "Do you want to play a game"
		$Sprite2D.visible = true
		$Label.visible = true
		girl_talking= true
		$female.play()
		await get_tree().create_timer(2.0).timeout
		$female.stop()
		$male.play()
		$Sprite2D.visible = false
		$Sprite2D2.visible = true
		girl_talking= false
		boy_talking = true
		$Label.text = "No, I do not partake in 'games'"
	if GlobalVariables.text_question == 6:
		GlobalVariables.failed_text = "He's a businessman, not a therapist"
		GlobalVariables.action_picked = true
		GlobalVariables.action_picked = true
		correct = 4
		$wait_timer.start(5)
		await get_tree().create_timer(0.5).timeout
		$Sprite2D2.visible = false
		$Label.text = "I've been feeling lost recently"
		$Sprite2D.visible = true
		$Label.visible = true
		girl_talking= true
		$female.play()
		await get_tree().create_timer(3).timeout
		$female.stop()
		$male.play()
		$Sprite2D.visible = false
		$Sprite2D2.visible = true
		girl_talking= false
		boy_talking = true
		$Label.text = "what."
	if GlobalVariables.text_question == 7 && pressed == 7:
		GlobalVariables.failed_text = "First of all, I don't
		think he sees grass, second of all, 
		that was too obvious"
		GlobalVariables.action_picked = true
		GlobalVariables.action_picked = true
		$wait_timer.start(5)
		await get_tree().create_timer(0.5).timeout
		$Sprite2D2.visible = false
		$Label.text = "You know what would really boost
		my mood? You."
		$Sprite2D.visible = true
		$Label.visible = true
		girl_talking= true
		$female.play()
		await get_tree().create_timer(3.5).timeout
		$female.stop()
		$male.play()
		$Sprite2D.visible = false
		$Sprite2D2.visible = true
		girl_talking= false
		boy_talking = true
		$Label.text = "Uhh..."
	if GlobalVariables.text_question == 8 && pressed == 8:
		GlobalVariables.failed_text = "I think he got nervous"
		GlobalVariables.action_picked = true
		GlobalVariables.action_picked = true
		$wait_timer.start(6)
		await get_tree().create_timer(0.5).timeout
		$Sprite2D2.visible = false
		$Label.text = "So..."
		$Sprite2D.visible = true
		$Label.visible = true
		girl_talking= true
		$female.play()
		await get_tree().create_timer(1.5).timeout
		$female.stop()
		$male.play()
		$Sprite2D.visible = false
		$Sprite2D2.visible = true
		girl_talking= false
		boy_talking = true
		$Label.text = "....."
	if GlobalVariables.text_question == 9 && pressed == 9:
		GlobalVariables.failed_text = "Don't think he really
		cared"
		GlobalVariables.action_picked = true
		GlobalVariables.action_picked = true
		$wait_timer.start(6)
		await get_tree().create_timer(0.5).timeout
		$Sprite2D2.visible = false
		$Label.text = "Did you know that smuggling water
		gets millions of fish killed each year?"
		$Sprite2D.visible = true
		$Label.visible = true
		girl_talking= true
		$female.play()
		await get_tree().create_timer(4).timeout
		$female.stop()
		$male.play()
		$Sprite2D.visible = false
		$Sprite2D2.visible = true
		girl_talking= false
		boy_talking = true
		$Label.text = "So?"
	if GlobalVariables.text_question == 10 && pressed == 10:
			ending = 4
			GlobalVariables.action_picked = true
			GlobalVariables.action_picked = true
			$"end timer".start(6)
			await get_tree().create_timer(0.5).timeout
			$Sprite2D2.visible = false
			$Label.text = "..."
			$Sprite2D.visible = true
			$Label.visible = true
			girl_talking= true
			$female.play()
			await get_tree().create_timer(4).timeout
			$female.stop()
			$male.play()
			$Sprite2D.visible = false
			$Sprite2D2.visible = true
			girl_talking= false
			boy_talking = true
			$Label.text = "are u ok?"
	

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
	$female.stop()
	$male.stop()
	if GlobalVariables.text_question == 5 && correct < 5 && pressed == 5:
		GlobalVariables.failed = true
		print("lost 1")
		girl_talking= false
		boy_talking = false
		print(correct)
		print(GlobalVariables.text_question)
		print(pressed)
	else:
		GlobalVariables.action_picked = false
		girl_talking= false
		boy_talking = false
		print("correct")

	if GlobalVariables.text_question == 6 && correct < 6 && pressed == 6:
		GlobalVariables.failed = true
		print("lost 2")
	else:
		GlobalVariables.action_picked = false
	if GlobalVariables.text_question == 7 && correct < 7 && pressed == 7:
		GlobalVariables.failed = true
		print("lost 2")
	else:
		GlobalVariables.action_picked = false
	if GlobalVariables.text_question == 8 && correct < 8 && pressed == 8:
		GlobalVariables.failed = true
		print("lost 2")
	else:
		GlobalVariables.action_picked = false
	if GlobalVariables.text_question == 9 && correct < 9 && pressed == 9:
		GlobalVariables.failed = true
		print("lost 2")
	else:
		GlobalVariables.action_picked = false
	if GlobalVariables.text_question == 10 && correct < 10 && pressed == 10:
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
func speech():
	if boy_talking == true:
		$AnimatedSprite2D2.play("talking")
		await get_tree().create_timer(0.33).timeout
	else:
		$AnimatedSprite2D2.play("default")
	if girl_talking == true:
		$AnimatedSprite2D.play("talking")
		await get_tree().create_timer(0.4).timeout
	else:
		$AnimatedSprite2D.play("default")
func _on_end_timer_timeout():
	if ending == 1:
		get_tree().change_scene_to_file("res://truth_ending.tscn")
	elif ending == 2:
		get_tree().change_scene_to_file("res://bed_ending.tscn")
	elif ending == 3:
		get_tree().change_scene_to_file("res://canon_ending.tscn")
	elif ending == 4:
		get_tree().change_scene_to_file("res://wait_ending.tscn")

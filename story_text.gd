extends ParallaxBackground

var messages = [
	"Mission briefing:


Agent, your mission is to infiltrate and extract information condeming 
Jeff. You will do this by catfishing him online and then 
entering a call with him, where your goal is to acquire info that 
Jeff is smuggling water into the city. As you know, we banned water 
recently to save the fish and so this is a very serious crime. Get caught, 
and well, it'll be nice knowing you. Good luck, agent.

Gameplay: This is a choice based game. You will get a certain amount of 
choices indicated by buttons on your screen when necessary. Click the 
buttons to choose an action. If you select certain bad options you will 
end up losing, but there are different ways to end this game (hint hint). 
Good luck and have fun!"
]

var typing_speed = .05
var read_time = 2

var current_message = 0
var display = ""
var current_char = 0

func _ready():
	start_dialogue()
	
func start_dialogue():
	current_message = 0
	display = ""
	current_char = 0
	
	$"../next_char".set_wait_time(typing_speed)
	$"../next_char".start()

func stop_dialogue():
	# get_parent().remove_child(self)
	queue_free()

func _on_next_char_timeout():
	if (current_char < len(messages[current_message])):
		var next_char = messages[current_message][current_char]
		display += next_char
		
		$ParallaxLayer/Node2D/Label.text = display
		current_char += 1
	else:
		$"../next_char".stop()
		print("stop")


extends Node2D

var word_delay = 0.1
# Called when the node enters the scene tree for the first time.
func _ready():
	showDialogue("Reymon","Welcome stranger, this is a random text generated by Reymon for Reymon because of  Reymon, By the power of this text, i can alingn the little underscore things i plan to have under each row of text, believe me, this will suck if i change the size of the paper") 
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func showDialogue(name, text):
	%NameLabel.text = name
	renderText(text)
	visible = true
	
func hideDialogue():
	%NameLabel.text = ""
	%TextLabel.text = ""
	visible = false
	
func renderText(text):
	var words = text.split(" ")
	for word in words:
		%TextLabel.text += word + " "  # Add the word and a space
		await get_tree().create_timer(word_delay).timeout

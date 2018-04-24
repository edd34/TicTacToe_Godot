extends RichTextLabel

onready var label_page = get_node("../../Footer/Label")

var dialog = ["TicTacoToe help.",
			"You can press on the text to make it appear quicly.",
			"The entire game can be played with click.",
			"More are coming soon",
			"End of the tutorial."]

var page = 0

func _ready():
	set_process_input(true)
	set_bbcode(dialog[page])
	set_visible_characters(0)
	label_page.text = str(page+1)+" / "+str(dialog.size())
	pass

func _input(event):
   # Mouse in viewport coordinates
	if (event is InputEventMouseButton) and (event.is_pressed()) :
		set_visible_characters(get_total_character_count())

func _on_Timer_timeout():
	set_visible_characters(get_visible_characters()+1)


func _on_Next_pressed():
	if page < dialog.size()-1 :
		page += 1
		set_bbcode(dialog[page])
		set_visible_characters(0)
		label_page.text = str(page+1)+" / "+str(dialog.size())


func _on_Previous_pressed():
	if page > 0 :
		page -= 1
		set_bbcode(dialog[page])
		set_visible_characters(0)
		label_page.text = str(page+1)+" / "+str(dialog.size())

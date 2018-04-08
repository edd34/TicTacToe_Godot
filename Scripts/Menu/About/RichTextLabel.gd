extends RichTextLabel

var dialog = ["hey! My name is benjamin","Welcome to my Godot dialog tutorial"]

var page = 0

func _ready():
	set_process_input(true)
	set_bbcode(dialog[page])
	set_visible_characters(0)
	pass

func _input(event):
   # Mouse in viewport coordinates
	if (event is InputEventMouseButton) :
		if get_visible_characters() > get_total_character_count():
			if page < dialog.size()-1:
				page += 1
				set_bbcode(dialog[page])
				set_visible_characters(0)
		else:
			set_visible_characters(get_total_character_count())

func _on_Timer_timeout():
	set_visible_characters(get_visible_characters()+1)
	pass # replace with function body

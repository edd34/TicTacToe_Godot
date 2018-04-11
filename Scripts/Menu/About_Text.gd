extends RichTextLabel

var line
var autoscroll_state
onready var checkButton = get_node("../../Footer/CheckButton")

func _ready():
	line = 0
	push_align(ALIGN_CENTER)
	autoscroll_state = false
	scroll_active = true
	pass


func _on_Timer_timeout():
	if  autoscroll_state == true and line < get_line_count():
		line+=1
		scroll_to_line(line)
		if line == get_line_count():
			line = 0
	pass # replace with function body


func _on_CheckButton_pressed():
	if autoscroll_state == false:
		scroll_active = false
		autoscroll_state = true
	elif autoscroll_state == true:
		scroll_active = true
		autoscroll_state = false
	pass # replace with function body

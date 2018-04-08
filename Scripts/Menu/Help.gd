extends Button

func _ready():
	pass


func _on_Help_pressed():
	#print(get_node("./PopupMenu").name)
	get_node("./Popup").show()
	pass # replace with function body

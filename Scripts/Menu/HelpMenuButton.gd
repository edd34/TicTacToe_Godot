extends Button

func _ready():
	pass


func _on_Help_pressed():
	get_node("/root/global").goto_scene("res://Scenes/Help.tscn")
	pass # replace with function body

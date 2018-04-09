extends Button

func _ready():
	pass


func _on_AboutButton_pressed():
	get_node("/root/global").goto_scene("res://Scenes/About.tscn")
	pass # replace with function body

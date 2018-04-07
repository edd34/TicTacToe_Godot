extends Button

func _ready():
	pass


func _on_HomeButton_pressed():
	get_node("/root/global").goto_scene("res://Scenes/MainMenu.tscn")
	pass # replace with function body

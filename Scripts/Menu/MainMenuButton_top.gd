extends Button

onready var HomeButton = get_tree().get_root().get_node("Node/Header/MainMenu")

func _ready():
	#HomeButton.connect("pressed",self,"_on_MainMenu_pressed")
	pass

func _on_MainMenu_pressed():
	get_node("/root/global").goto_scene("res://Scenes/MainMenu.tscn")
	pass # replace with function body

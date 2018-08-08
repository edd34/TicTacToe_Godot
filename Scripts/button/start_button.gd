extends Button

onready var button_start = get_tree().get_root().get_node("Splash/MarginContainer_body/CenterContainer/VBoxContainer/Button")
onready var timer = get_tree().get_root().get_node("Splash/Timer")

var focus

func _ready():
	timer.connect("timeout",self,"_on_timeout")
	button_start.connect("pressed",self,"_on_pressed_start_button")
	pass

func _on_timeout():
	if button_start.is_hovered() == false :
		if button_start.pressed == true :
			button_start.pressed = false
		else :
			button_start.pressed = true
	else :
		button_start.pressed = false
	pass
	
func _on_pressed_start_button():
	get_node("/root/global").goto_scene("res://Scenes/MainMenu.tscn")
	pass
extends Button

onready var SettingsButton = get_tree().get_root().get_node("Node/MarginContainer/CenterContainer/MainScreen/MainMenu/Settings")


func _ready():
	SettingsButton.connect("pressed",self,"_on_Settings_pressed")
	pass


func _on_Settings_pressed():
	get_node("/root/global").goto_scene("res://Scenes/Settings.tscn")
	pass # replace with function body

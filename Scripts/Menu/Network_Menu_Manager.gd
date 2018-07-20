extends HBoxContainer

onready var back_button = get_tree().get_root().get_node("Node/MarginContainer/MainScreen/Bottom/BackButton")
onready var next_button = get_tree().get_root().get_node("Node/MarginContainer/MainScreen/Bottom/NextButton")
onready var selector = get_tree().get_root().get_node("Node/MarginContainer/MainScreen/OptionButton")

func _ready():
	back_button.connect("pressed",self,"_on_back_button_pressed")
	next_button.connect("pressed",self,"_on_next_button_pressed")
	pass

func _on_back_button_pressed():
	get_node("/root/global").goto_scene("res://Scenes/MainMenu.tscn")
	pass

func _on_next_button_pressed():
	#print(selector.get_item_text(selector.get_selected_id()))
	if(selector.get_item_text(selector.get_selected_id()) == "Client"):
		print("client selected")
	elif(selector.get_item_text(selector.get_selected_id()) == "Server"):
			print("server selected")
	pass
extends Node

onready var timer_node = get_tree().get_root().get_node("Node/MarginContainer/MainScreen/Status_Node/Timer")
onready var label_node = get_tree().get_root().get_node("Node/MarginContainer/MainScreen/Status_Node/Label")
onready var selector = get_tree().get_root().get_node("Node/MarginContainer/MainScreen/OptionButton")

var counter = 0

func _ready():
	selector.connect("item_selected",self,"_on_item_selected")
	pass

func _on_item_selected(ID):
	if(selector.get_item_text(ID) == "Client"):
		print("client selected")
		if timer_node.is_connected("timeout",self,"_update_label"):
			timer_node.disconnect("timeout",self,"_update_label")
			label_node.text = ""

	elif(selector.get_item_text(ID) == "Server"):
			print("server selected")
			timer_node.connect("timeout",self,"_update_label")
			pass
	pass

func _update_label():
	counter = (counter + 1)%3 + 1
	
	match counter:
		1:
			label_node.text = "waiting for a client to connect \n..."
			pass
	
		2:
			label_node.text = "waiting for a client to connect \n.."
			pass

		3:
			label_node.text = "waiting for a client to connect \n."
			pass
	pass
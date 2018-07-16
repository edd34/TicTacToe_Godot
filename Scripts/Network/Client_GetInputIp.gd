extends VBoxContainer

onready var InputDigit1 = get_tree().get_root().get_node("Node/MarginContainer/MainScreen/ClientMode/HBoxContainer/Part1/LineEdit")
onready var InputDigit2 = get_tree().get_root().get_node("Node/MarginContainer/MainScreen/ClientMode/HBoxContainer/Part2/LineEdit2")
onready var InputDigit3 = get_tree().get_root().get_node("Node/MarginContainer/MainScreen/ClientMode/HBoxContainer/Part3/LineEdit3")
onready var InputDigit4 = get_tree().get_root().get_node("Node/MarginContainer/MainScreen/ClientMode/HBoxContainer/Part4/LineEdit4")

func _ready():
	pass

func checkBoundariesIp4(var digit):
	
	pass

func throwErrorDigit(var digit):
	pass

func getStringDigit():
	pass

func getIpv4():
	pass

func saveIpv4():
	pass
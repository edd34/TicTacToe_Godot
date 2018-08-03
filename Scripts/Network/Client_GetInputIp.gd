extends VBoxContainer

onready var InputDigit1 = get_tree().get_root().get_node("Node/MarginContainer/MainScreen/ClientMode/HBoxContainer/Part1/LineEdit")
onready var InputDigit2 = get_tree().get_root().get_node("Node/MarginContainer/MainScreen/ClientMode/HBoxContainer/Part2/LineEdit2")
onready var InputDigit3 = get_tree().get_root().get_node("Node/MarginContainer/MainScreen/ClientMode/HBoxContainer/Part3/LineEdit3")
onready var InputDigit4 = get_tree().get_root().get_node("Node/MarginContainer/MainScreen/ClientMode/HBoxContainer/Part4/LineEdit4")
onready var configure_button = get_tree().get_root().get_node("Node/MarginContainer/MainScreen/ClientMode/configure_btn")

var input_IP_address = ""

func _ready():
	configure_button.connect("pressed",self,"_on_conf_btn_pressed")
	pass

func _on_conf_btn_pressed():
	print("conf btn pressed")
	saveIpv4()
	pass

func checkBoundariesIp4(digit):
	if int(digit.text) >= 0 && int(digit.text) <= 255 :
		return true
	else:
		return false
	pass

func throwErrorDigit(digit):
	pass

func getStringDigit():
	input_IP_address = InputDigit1.text+"."+InputDigit2.text+"."+InputDigit3.text+"."+InputDigit4.text
	print(input_IP_address)
	return str(input_IP_address)
	pass

func getIpv4():
	return str(get_node("/root/global_network").get_IP_address())
	pass

func saveIpv4():
	get_node("/root/global_network").set_IP_address(getStringDigit())
	print("IP address configured : " + getIpv4())
	pass
extends OptionButton

onready var IpSelector =  get_tree().get_root().get_node("Node/MarginContainer/MainScreen/ServerMode/HBoxContainer/Ip_Selector")

func _ready():
	for i in range (0,IP.get_local_addresses().size()) :
		#print(i)
		IpSelector.add_item(IP.get_local_addresses()[i],i)
		pass

	pass
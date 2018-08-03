extends Node

var IP_address = ""
#var network_connected = false
enum network_status {client = 1, server = 2, not_connected = 0}

func _ready():
	pass

func set_IP_address(param):
	IP_address = str(param)
	pass

func get_IP_address():
	return str(IP_address)
	pass
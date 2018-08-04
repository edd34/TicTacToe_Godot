extends HBoxContainer

onready var back_button = get_tree().get_root().get_node("Node/MarginContainer/MainScreen/Bottom/BackButton")
onready var next_button = get_tree().get_root().get_node("Node/MarginContainer/MainScreen/Bottom/NextButton")
onready var selector = get_tree().get_root().get_node("Node/MarginContainer/MainScreen/OptionButton")

func _ready():
	back_button.connect("pressed",self,"_on_back_button_pressed")
	next_button.connect("pressed",self,"_on_next_button_pressed")
	get_tree().connect("network_peer_connected",self,"_player_connected")
	get_tree().connect("connected_to_server",self,"_connected_ok")
	pass

func _on_back_button_pressed():
	get_node("/root/global").goto_scene("res://Scenes/MainMenu.tscn")
	pass

func _on_next_button_pressed():
	#print(selector.get_item_text(selector.get_selected_id()))
	if(selector.get_item_text(selector.get_selected_id()) == "Client"):
		print("client selected")
		var peer = NetworkedMultiplayerENet.new()
		print(get_node("/root/global_network").get_IP_address())
		peer.create_client(get_node("/root/global_network").get_IP_address(), 7159)
		get_tree().set_network_peer(peer)
		print(get_tree().is_network_server())
		pass
	elif(selector.get_item_text(selector.get_selected_id()) == "Server"):
		print("server selected")
		var peer = NetworkedMultiplayerENet.new()
		peer.create_server(7159, 1)
		get_tree().set_network_peer(peer)
		print(get_tree().is_network_server())
		pass

func _player_connected(id):
	print("Player connected",id)
	pass

func _connected_ok():
	print("connected ok")
	get_node("/root/global").goto_scene("res://Scenes/remotePlayer.tscn")
	pass

func network_peer_connected():
	print("network peer connected")
	pass
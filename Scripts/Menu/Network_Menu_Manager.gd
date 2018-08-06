extends HBoxContainer

onready var back_button = get_tree().get_root().get_node("Node/MarginContainer/MainScreen/Bottom/BackButton")
onready var next_button = get_tree().get_root().get_node("Node/MarginContainer/MainScreen/Bottom/NextButton")
onready var selector = get_tree().get_root().get_node("Node/MarginContainer/MainScreen/OptionButton")
onready var margin_container = get_tree().get_root().get_node("Node/MarginContainer")
onready var timer_node = get_tree().get_root().get_node("Node/MarginContainer/MainScreen/Status_Node/Timer")
onready var status_node = get_tree().get_root().get_node("Node/MarginContainer/MainScreen/Status_Node")

func _ready():
	back_button.connect("pressed",self,"_on_back_button_pressed")
	next_button.connect("pressed",self,"_on_next_button_pressed")
	get_tree().connect("network_peer_connected",self,"_player_connected")
	get_tree().connect("connected_to_server",self,"_connected_ok")
	get_tree().connect("server_disconnected", self, "_server_disconnected")
	pass

func _on_back_button_pressed():
	get_node("/root/global").goto_scene("res://Scenes/MainMenu.tscn")
	get_tree().set_network_peer(null)
	pass

func _on_next_button_pressed():
	#print(selector.get_item_text(selector.get_selected_id()))
	if(selector.get_item_text(selector.get_selected_id()) == "Client"):
		get_node("/root/global_network").my_network_status = 1
		print("client selected")
		var peer = NetworkedMultiplayerENet.new()
		print(get_node("/root/global_network").get_IP_address())
		peer.create_client(get_node("/root/global_network").get_IP_address(), 7159)
		get_tree().set_network_peer(peer)
		print(get_tree().is_network_server())
		pass
	elif(selector.get_item_text(selector.get_selected_id()) == "Server"):
		get_node("/root/global_network").my_network_status = 2
		print("server selected")
		var peer = NetworkedMultiplayerENet.new()
		peer.create_server(7159, 1)
		get_tree().set_network_peer(peer)
		print(get_tree().is_network_server())
		#get_tree().get_root().get_node("Node/MarginContainer/MainScreen/Status_Node")
		timer_node.connect("timeout",status_node,"_update_label")
		pass

func _player_connected(id):
	print("Player connected",id)
	margin_container.hide()
	get_node("/root/global").goto_scene("res://Scenes/remotePlayer.tscn")
	#var instance_node = remote_play_scene.instance()
	#add_child(instance_node)
	
	pass

func _connected_ok():
	print("connected ok")
	margin_container.hide()
	get_node("/root/global").goto_scene("res://Scenes/remotePlayer.tscn")
	#var instance_node = remote_play_scene.instance()
	#add_child(instance_node)
	
	pass

func network_peer_connected():
	print("network peer connected")
	pass
	
func _server_disconnected():
	get_tree().set_network_peer(null)
	get_node("/root/global").goto_scene("res://Scenes/MainMenu.tscn")
	pass
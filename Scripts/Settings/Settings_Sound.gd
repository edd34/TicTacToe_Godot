extends Node

onready var master_volume_slider = get_tree().get_root().get_node("Node/Body/VBoxContainer/Master/VBoxContainer/HSlider")
onready var sfx_volume_slider = get_tree().get_root().get_node("Node/Body/VBoxContainer/SFX/VBoxContainer/HSlider")
onready var music_volume_slider = get_tree().get_root().get_node("Node/Body/VBoxContainer/Music/VBoxContainer/HSlider")
onready var master_volume_label = get_tree().get_root().get_node("Node/Body/VBoxContainer/Master/VBoxContainer/Label")
onready var sfx_volume_label = get_tree().get_root().get_node("Node/Body/VBoxContainer/SFX/VBoxContainer/Label")
onready var music_volume_label = get_tree().get_root().get_node("Node/Body/VBoxContainer/Music/VBoxContainer/Label")
onready var mute_checkbutton_node = get_tree().get_root().get_node("Node/Body/VBoxContainer/CheckButton")
onready var save_node = get_tree().get_root().get_node("Node/Footer/Save")
onready var reset_node = get_tree().get_root().get_node("Node/Footer/Reset")

func _ready():
	load_prefs()
	master_volume_slider.connect("value_changed",self,"_update_master_volume")
	sfx_volume_slider.connect("value_changed",self,"_update_sfx_volume")
	music_volume_slider.connect("value_changed",self,"_update_music_volume")
	mute_checkbutton_node.connect("toggled",self,"_on_mute_toggled")
	save_node.connect("pressed",self,"_on_save_pressed")
	reset_node.connect("pressed",self,"_on_reset_pressed")
	pass

func _update_master_volume(value):
	master_volume_label.text = str(value)
	if value > 0:
		AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"), false)
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"),-60*(1-value/100))
	else:
		AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"), true)
	pass

func _update_sfx_volume(value):
	sfx_volume_label.text = str(value)
	if value > 0:
		AudioServer.set_bus_mute(AudioServer.get_bus_index("SFX"), false)
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("SFX"),-60*(1-value/100))
	else:
		AudioServer.set_bus_mute(AudioServer.get_bus_index("SFX"), true)
	pass

func _update_music_volume(value):
	music_volume_label.text = str(value)
	if value > 0:
		AudioServer.set_bus_mute(AudioServer.get_bus_index("Music"), false)
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"),-60*(1-value/100))
	else:
		AudioServer.set_bus_mute(AudioServer.get_bus_index("Music"), true)
	pass
	
func _on_mute_toggled(boolean):
	AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"), boolean)
	pass

func _on_save_pressed():
	write_file(save())
	pass

func _on_reset_pressed():
	write_file(reset())
	load_prefs()
	pass

func save():
	var save_dict = {
		"master_volume" : int(master_volume_label.text),
		"music_volume" : int(music_volume_label.text),
		"sfx_volume" : int(sfx_volume_label.text),
		"mute" : mute_checkbutton_node.is_pressed()
	}
	return save_dict

func reset():
	var reset_dict = {
		"master_volume" : 100,
		"music_volume" : 80,
		"sfx_volume" : 100,
		"mute" : false
	}
	return reset_dict

func write_file(arg):
	var save_game = File.new()
	save_game.open("user://TicTacToe_settings_prefs.save", File.WRITE)
	save_game.store_line(to_json(arg))
	save_game.close()
	pass

func load_prefs():
	var save_game = File.new()
	if not save_game.file_exists("user://TicTacToe_settings_prefs.save"):
		write_file(reset())
	
	# Load the file line by line and process that dictionary to restore the object it represents
	save_game.open("user://TicTacToe_settings_prefs.save", File.READ)
	var dict = parse_json(save_game.get_line())
	_update_master_volume(dict["master_volume"])
	master_volume_slider.value = dict["master_volume"]
	_update_music_volume(dict["music_volume"])
	music_volume_slider.value = dict["music_volume"]
	_update_sfx_volume(dict["sfx_volume"])
	sfx_volume_slider.value = dict["sfx_volume"]
	mute_checkbutton_node.pressed = dict["mute"]
	_on_mute_toggled(dict["mute"])
	pass

func _on_game_start_load_prefs():
	var save_game = File.new()
	if not save_game.file_exists("user://TicTacToe_settings_prefs.save"):
		write_file(reset())
	
	# Load the file line by line and process that dictionary to restore the object it represents
	save_game.open("user://TicTacToe_settings_prefs.save", File.READ)
	var dict = parse_json(save_game.get_line())

	if dict["master_volume"] > 0:
		AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"), false)
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"),-60*(1-dict["master_volume"]/100))
	else:
		AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"), true)

	if dict["music_volume"] > 0:
		AudioServer.set_bus_mute(AudioServer.get_bus_index("Music"), false)
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"),-60*(1-dict["music_volume"]/100))
	else:
		AudioServer.set_bus_mute(AudioServer.get_bus_index("Music"), true)

	if dict["sfx_volume"] > 0:
		AudioServer.set_bus_mute(AudioServer.get_bus_index("SFX"), false)
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("SFX"),-60*(1-dict["sfx_volume"]/100))
	else:
		AudioServer.set_bus_mute(AudioServer.get_bus_index("SFX"), true)

	AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"), dict["mute"])

	pass
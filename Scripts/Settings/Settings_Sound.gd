extends Node

onready var master_volume_slider = get_tree().get_root().get_node("Node/Body/VBoxContainer/Master/VBoxContainer/HSlider")
onready var sfx_volume_slider = get_tree().get_root().get_node("Node/Body/VBoxContainer/SFX/VBoxContainer/HSlider")
onready var music_volume_slider = get_tree().get_root().get_node("Node/Body/VBoxContainer/Music/VBoxContainer/HSlider")

onready var master_volume_label = get_tree().get_root().get_node("Node/Body/VBoxContainer/Master/VBoxContainer/Label")
onready var sfx_volume_label = get_tree().get_root().get_node("Node/Body/VBoxContainer/SFX/VBoxContainer/Label")
onready var music_volume_label = get_tree().get_root().get_node("Node/Body/VBoxContainer/Music/VBoxContainer/Label")

onready var mute_checkbutton_node = get_tree().get_root().get_node("Node/Body/VBoxContainer/CheckButton")

func _ready():
	master_volume_slider.connect("value_changed",self,"_update_master_volume")
	sfx_volume_slider.connect("value_changed",self,"_update_sfx_volume")
	music_volume_slider.connect("value_changed",self,"_update_music_volume")
	mute_checkbutton_node.connect("toggled",self,"_on_mute_toggled")
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
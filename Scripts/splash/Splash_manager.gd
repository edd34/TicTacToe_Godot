extends Node

onready var splash1_node = get_tree().get_root().get_node("Splash0/splash1")
onready var splash2_node = get_tree().get_root().get_node("Splash0/splash2")
onready var timer_node = get_tree().get_root().get_node("Splash0/Timer")
onready var AudioStreamPlayer_node = get_tree().get_root().get_node("Splash0/AudioStreamPlayer")

var alpha = 0.0
var state = [0,0,0]
var delta = 0.008

func _ready():
	load("res://Scripts/Settings/Settings_Sound.gd").new()._on_game_start_load_prefs()
	splash1_node.hide()
	splash1_node.modulate = Color(1,1,1,0)
	splash2_node.hide()
	splash2_node.modulate = Color(1,1,1,0)
	splash1_node.show()
	timer_node.connect("timeout",self,"_on_timeout")
	AudioStreamPlayer_node.play()
	pass

func _on_timeout():
	match state :
		[0,0,0] :
			if alpha < 1 :
				alpha += delta
				splash1_node.modulate = Color(1,1,1,alpha)
			else :
				alpha = 1
				state = [0,0,1]
			pass

		[0,0,1] :
			if alpha > 0 :
				alpha -= delta
				splash1_node.modulate = Color(1,1,1,alpha)
			else : 
				alpha = 0
				splash1_node.hide()
				splash2_node.show()
				state = [0,1,0]
				#timer_node.wait_time = 0.75
			pass
			
		[0,1,0] :
			if alpha < 1 :
				alpha += delta
				splash2_node.modulate = Color(1,1,1,alpha)
			else : 
				alpha = 1
				state = [0,1,1]
			pass
			
		[0,1,1] :
			if alpha > 0 :
				alpha -= delta
				splash2_node.modulate = Color(1,1,1,alpha)
				AudioStreamPlayer_node.volume_db = -(1-alpha)*60 #-= alpha # ~= -(1 - alpha)*60
			else : 
				alpha = 0
				splash1_node.hide()
				splash2_node.hide()
				state = [1,0,0]
				get_node("/root/global").goto_scene("res://Scenes/Splash.tscn")
				pass
				
		[1,0,0]:
			
			pass
	pass
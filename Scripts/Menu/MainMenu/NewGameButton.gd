extends Button

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_NewGameButton_pressed():
	get_node("/root/global").goto_scene("res://Scenes/Play.tscn")
	get_node("/root/Board")._ready()
	pass # replace with function body

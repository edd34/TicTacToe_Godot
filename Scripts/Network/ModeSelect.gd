extends OptionButton

onready var selector = get_node(".")
onready var clientModeNode = get_node("../ClientMode")
onready var serverModeNode = get_node("../ServerMode")
onready var NextButton = get_tree().get_root().get_node("Node/MarginContainer/MainScreen/Bottom/NextButton")

var mode

func _ready():
	selector.connect("item_selected",self,"_on_item_selected")
	pass

func _on_item_selected(id):
	if get_item_text(id) == "Client":
		clientModeNode.show()
		serverModeNode.hide()
		mode = "client"
		NextButton.text = "Join"
	elif get_item_text(id) == "Server":
		clientModeNode.hide()
		serverModeNode.show()
		mode = "server"
		NextButton.text = "Host"
	NextButton.show()

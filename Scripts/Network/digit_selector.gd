extends VBoxContainer

onready var myDigit = $Digit
onready var plus = $Plus
onready var minus = $Minus

func _ready():
	print(myDigit.name)
	myDigit.text = str(0)
	plus.connect("pressed",self,"_on_Plus_pressed")
	minus.connect("pressed",self,"_on_Minus_pressed")
	pass

func _on_Plus_pressed():
	myDigit.text = str(int(myDigit.text)+1)
	pass

func _on_Minus_pressed():
	myDigit.text = str(int(myDigit.text)-1)
	pass
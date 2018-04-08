extends Sprite

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var sprite_X = preload("res://Assets/x.png")
var sprite_O = preload("res://Assets/o.png")

onready var parent_node = get_parent()

func setSprite_X():
	self.set_texture(sprite_X)
	self.apply_scale(Vector2(0.5,0.5))
	pass

func setSprite_O():
	self.set_texture(sprite_O)
	self.apply_scale(Vector2(0.5,0.5))
	pass
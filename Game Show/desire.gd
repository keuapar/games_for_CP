extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var bar = $TextureProgress
onready var img = $TextureRect
export var updating = false
var own_width
var own_type
var own_ID

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
func init(des_type):
	own_type = des_type
	print(self.rect_size)
	img.rect_size = self.rect_size
	print('desire initiated successfuly')

func _process(delta):
	if updating:
		bar_update(100*delta)

func bar_update(diff):
	bar.value += diff

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


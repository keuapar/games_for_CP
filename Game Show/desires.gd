extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var desire_scene = preload("res://desire.tscn")
var desires = []
var num_desires
var toucher
var bar

# Called when the node enters the scene tree for the first time.
func _ready():
	num_desires = randi() % 3 + 1 # Returns random integer between 1 and 3
	for i in range(num_desires):
		var new_desire = desire_scene.instance()
		add_child(new_desire)
		new_desire.init('xyz')
		desires.append(new_desire)
		
	print(desires)
	desires = get_tree().get_nodes_in_group('desires')

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_deer_touched(item):
	toucher = item
	if item.name == 'act01':
		bar = $desire_test
		bar.updating = true


func _on_deer_touched_end(item):
	if item == toucher:
		bar.updating = false

extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

signal touched(item)
signal touched_end(item)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_area_entered(item):
	print(item)
	emit_signal('touched', item)


func _on_Area2D_area_exited(item):
	emit_signal("touched_end", item)

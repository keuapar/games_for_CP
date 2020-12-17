extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var previous_mouse_position = Vector2()
var is_dragging = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_act01_input_event(viewport, event, shape_idx):
	
	if event.is_action_pressed('ui_touch'):
		print(event)
		get_tree().set_input_as_handled()
		previous_mouse_position = event.position
		is_dragging = true
	
func _input(event):
	if not is_dragging:
		return
		
	if event.is_action_released('ui_touch'):
		previous_mouse_position = Vector2()
		is_dragging = false
	
	if is_dragging and event is InputEventMouseMotion:
		position += event.position - previous_mouse_position
		previous_mouse_position = event.position

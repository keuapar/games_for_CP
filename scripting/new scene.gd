extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal ms(v1, v2)

# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.connect("timeout", self, "_on_Timer_timeout")
	emit_signal("ms")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	$Sprite.visible = !$Sprite.visible

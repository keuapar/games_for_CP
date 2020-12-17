extends Panel

func _ready():
	get_node("butt").connect("pressed", self, "_on_butt_pressed")
	
func _on_butt_pressed():
	get_node("Label").text = "hi"
	

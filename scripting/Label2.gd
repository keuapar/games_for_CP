extends Label

var acc = 0

func _process(delta):
	acc += delta
	text = str(acc)

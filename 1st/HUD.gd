extends CanvasLayer


signal start_game


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func show_message(text):
	$Msg.text = text
	$Msg.show()
	$MsgTimer.start()
	
func show_game_over():
	show_message('Game Over!')
	yield($MsgTimer, 'timeout')
	
	$Msg.text = "Dodge 'em"
	$Msg.show()
	
	yield(get_tree().create_timer(1), 'timeout')
	$STARTbtn.show()
	
func update_score(score):
	$ScoreLbl.text = str(score)


func _on_MsgTimer_timeout():
	$Msg.hide()


func _on_STARTbtn_pressed():
	$STARTbtn.hide()
	emit_signal("start_game")

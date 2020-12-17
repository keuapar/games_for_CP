extends Node


export (PackedScene) var Mob
var score


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func game_over():
	$TimerScore.stop()
	$TimerMob.stop()
	$HUD.show_game_over()
	get_tree().call_group('mobs', 'queue_free')
	$music.stop()
	$death.play()
	
func game_start():
	score = 0
	$Player.start($StartPos.position)
	$TimerStart.start()
	$HUD.update_score(score)
	$HUD.show_message('Get reaaadddyyyy')
	$music.play()


func _on_TimerMob_timeout():
	$"MobPath/Mob Spawn Location".offset = randi()
	var mob = Mob.instance()
	add_child(mob)
	
	var direction = $"MobPath/Mob Spawn Location".rotation + PI/2
	mob.position = $"MobPath/Mob Spawn Location".position
	direction +=  rand_range(-PI/4, PI/4)
	mob.rotation = direction
	
	mob.linear_velocity = Vector2(rand_range(mob.min_speed, mob.max_speed), 0)
	mob.linear_velocity = mob.linear_velocity.rotated(direction)
	

func _on_TimerScore_timeout():
	score += 1
	$HUD.update_score(score)


func _on_TimerStart_timeout():
	$TimerScore.start()
	$TimerMob.start()

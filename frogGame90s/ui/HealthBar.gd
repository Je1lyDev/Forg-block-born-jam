extends Node2D


var health = 5


func _ready():
	$Sprite.set_frame(9)

func updateHealth():
	if health > 5:
		health = 5
	
	$AnimationPlayer.play("spin")


# warning-ignore:unused_argument
func _on_AnimationPlayer_animation_finished(anim_name):
	if health == 5:
		$Sprite.set_frame(9)
	if health == 4:
		$Sprite.set_frame(8)
	if health == 3:
		$Sprite.set_frame(7)
	if health == 2:
		$Sprite.set_frame(6)
	if health == 1:
		$Sprite.set_frame(5)
	if health == 0:
		$Sprite.set_frame(4)


func _on_player_healthdown():
	health -= 1
	updateHealth()


func _on_player_healthUp():
	health += 2
	updateHealth()

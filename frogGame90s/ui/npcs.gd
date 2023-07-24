extends Node2D

var excitment = 0

func _ready():
	$AnimationPlayer.play("move")

func _on_player_healthdown():
	$AnimationPlayer.play("Sad")

func _on_player_healthUp():
	$AnimationPlayer.play("Yay")

func _on_AnimationPlayer_animation_finished(anim_name):
	$AnimationPlayer.play("move")


func _on_world_kill():
	excitment += 1
	
func _physics_process(delta):
	
	if excitment == 10:
		$AnimationPlayer.play("Yay")
		excitment = 0

extends Node2D

onready var bubble = preload("res://player/PlayerBubble.tscn")

signal kill 
var Score = 0
func _ready():
	score()
	$AudioStreamPlayer.play()

func _on_player_shoot(location):
	var Bubble = bubble.instance()
	Bubble.global_position = location
	add_child(Bubble)

func score():
	$Ui/score.text = "SCORE:" + str(Score)

func _on_spawnManger_addScore():
	pass


func _on_spawnManger_BasicScore():
	Score += 10
	score()
	emit_signal("kill")
func _on_spawnManger_BetterScore():
	Score += 20
	score()
	emit_signal("kill")
func _on_spawnManger_BestScore():
	Score += 50
	score()
	emit_signal("kill")
func _on_spawnManger_BossScore():
	Score += 500
	score()
	emit_signal("kill")


func _on_player_died():
	$Timer.start()


func _on_Timer_timeout():
	get_tree().change_scene("res://ui/GameOver.tscn")

func _on_world_kill():
	pass # Replace with function body.


func _on_AudioStreamPlayer_finished():
	$AudioStreamPlayer.play()

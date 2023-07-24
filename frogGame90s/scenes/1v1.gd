extends Node2D

onready var bubble = preload("res://player/PlayerBubble.tscn")
onready var P2bubble = preload("res://player/PlayerBubbleP2.tscn")
signal kill 
var Score = 0


func _on_player_shoot(location):
	var Bubble = bubble.instance()
	Bubble.global_position = location
	add_child(Bubble)


func _on_player_died():
	$Timer.start()


func _on_Timer_timeout():
	get_tree().change_scene("res://ui/mainMenu.tscn")

func _on_world_kill():
	pass # Replace with function body.


func _on_player2_shoot2(location):
	var P2Bubble = P2bubble.instance()
	P2Bubble.global_position = location
	add_child(P2Bubble)


func _on_player2_died():
	$Timer.start()

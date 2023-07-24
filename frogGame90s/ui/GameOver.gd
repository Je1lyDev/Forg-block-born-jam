extends Control
onready var menu = preload("res://ui/mainMenu.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("fadeOut")


func _on_Timer_timeout():
	get_tree().change_scene("res://ui/mainMenu.tscn")


func _on_AnimationPlayer_animation_finished(anim_name):
	get_tree().change_scene("res://ui/mainMenu.tscn")

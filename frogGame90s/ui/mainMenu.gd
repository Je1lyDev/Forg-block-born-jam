extends Control

onready var game = preload("res://scenes/world.tscn")
var finished = false

func _ready():
	$AnimationPlayer.play("on")

# warning-ignore:unused_argument
func _physics_process(delta):
	if Input.is_action_just_pressed("attack1") and finished == true:
# warning-ignore:return_value_discarded
		get_tree().change_scene("res://ui/loadingScreen.tscn")

#func _on_Button_pressed():
	#get_tree().change_scene("res://scenes/world.tscn")


func _on_AnimationPlayer_animation_finished(anim_name):
	$AudioStreamPlayer.play()
	finished = true


func _on_AudioStreamPlayer_finished():
	$AudioStreamPlayer.play()

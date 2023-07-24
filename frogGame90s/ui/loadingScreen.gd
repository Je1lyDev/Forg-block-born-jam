extends Control


func _ready():
	$Timer.start()
	$AnimationPlayer.play("fade")


func _on_Timer_timeout():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://scenes/world.tscn")

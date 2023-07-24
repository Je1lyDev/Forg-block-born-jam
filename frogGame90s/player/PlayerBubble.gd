extends Area2D

export var speed = 500

func _on_PlayerBubble_area_entered(area):
	#area.hit(1)
	$AnimationPlayer.play("pop")
	speed = 0


func _ready():
	$Timer.start()

func _physics_process(delta):
	global_position.x += speed*delta


func _on_Timer_timeout():
	$AnimationPlayer.play("pop")


func _on_AnimationPlayer_animation_finished(anim_name):
	queue_free()

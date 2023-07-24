extends Area2D

export var health = 20


signal BossScore



func _physics_process(delta):
	if health == 0:
		queue_free()

func hit(damage):
	health -=damage
	if health == 0:
		emit_signal("BossScore")
		queue_free()
	
func _on_toad_area_entered(area):
	hit(1)
	$AnimationPlayer.play("hit")

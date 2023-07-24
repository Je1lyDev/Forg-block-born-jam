extends Area2D

var speed = 200
func _physics_process(delta):
	global_position.x -= speed*delta
	
func _ready():
	$AnimationPlayer.play("move")

func hit(damage):
	pass
	
func _on_Health_area_entered(area):
	if area.is_in_group("player"):
		queue_free()

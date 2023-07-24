extends Area2D
class_name enemy
export var health = 1
export var speed = 200
export var EnemyType = 1

signal BasicScore
signal BetterScore
signal BestScore
signal BossScore


func _ready():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var randomDir= rng.randi_range(-15,15)
	$AnimationPlayer.play("Move")
	
	$Timer.start()
	self.position.y += randomDir
	
	var spawnchance = RandomNumberGenerator.new()
	spawnchance.randomize()
	var chance = spawnchance.randi_range(1,2)
	
	if EnemyType == 3:
		if  chance == 2:
			queue_free()
		else:
			pass

func _physics_process(delta):
	global_position.x -= speed*delta
	if health == 0:
		queue_free()

func hit(damage):
	health -=damage
	if health == 0:
		queue_free()
		if EnemyType == 1:
			emit_signal("BasicScore")
		if EnemyType ==2:
			emit_signal("BetterScore")
		if EnemyType == 3:
			emit_signal("BestScore")
		if EnemyType ==4:
			emit_signal("BossScore")
		
func _on_fly_area_entered(area):
	if area.is_in_group("player"):
		hit(1)
		if EnemyType == 3:
			$AnimationPlayer.play("Hit")


func _on_Timer_timeout():
	queue_free()

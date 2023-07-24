extends KinematicBody2D
class_name player
export var speed = 300
var bonusSpeed = 0
var health = 5
var motion = Vector2.ZERO
var abeltoshoot = true
export var hype = false
onready var shootpos = $Position2D
signal healthdown
signal healthUp
signal shoot(location)
signal died

func _physics_process(delta):
	#MoveMent__________________________________
	motion.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	motion.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	
	global_position += motion*(speed + bonusSpeed) *delta
	#ATTACKS___________________________________
	if Input.is_action_just_pressed("attack1"):
		shoot()
		$AnimationPlayer.play("Buubles")
	#HEALTH____________________________________
	if health > 5:
		health = 5
	
	if health == 0:
		queue_free()
func hit(damage):
	health -= damage
	if health == 0:
		emit_signal("died")
		queue_free()

func shoot():
	if abeltoshoot == true:
		emit_signal("shoot",shootpos.global_position)
		abeltoshoot = false
	
# warning-ignore:unused_argument
func _on_Area2D_area_entered(area):
	if area.is_in_group("enemy"):
		hit(1)
		$AnimationPlayer.play("FrogGotBonked")
		emit_signal("healthdown")
	if area.is_in_group("player2"):
		hit(1)
		$AnimationPlayer.play("FrogGotBonked")
		emit_signal("healthdown")
	if area.is_in_group("health"):
		health += 2
		emit_signal("healthUp")

# warning-ignore:unused_argument
func _on_AnimationPlayer_animation_finished(Buubles):
	abeltoshoot = true


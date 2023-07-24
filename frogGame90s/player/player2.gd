extends KinematicBody2D
class_name player2
export var speed = 300
var bonusSpeed = 0
var health = 5
var motion = Vector2.ZERO
var abeltoshoot = true
export var hype = false
onready var shootpos = $Position2D
signal healthdown
signal healthUp
signal shoot2(location)
signal died

func _physics_process(delta):
	#MoveMent__________________________________
	motion.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	motion.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	
	global_position += motion*(speed + bonusSpeed) *delta
	#ATTACKS___________________________________
	if Input.is_action_just_pressed("shootP2"):
		shoot2()
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

func shoot2():
	if abeltoshoot == true:
		emit_signal("shoot2",shootpos.global_position)
		abeltoshoot = false
	
# warning-ignore:unused_argument
func _on_Area2D_area_entered(area):
	if area.is_in_group("enemy"):
		hit(1)
		$AnimationPlayer.play("FrogGotBonked")
		emit_signal("healthdown")
	if area.is_in_group("player"):
		hit(1)
		$AnimationPlayer.play("FrogGotBonked")
		emit_signal("healthdown")
	if area.is_in_group("health"):
		health += 2
		emit_signal("healthUp")

# warning-ignore:unused_argument
func _on_AnimationPlayer_animation_finished(Buubles):
	abeltoshoot = true


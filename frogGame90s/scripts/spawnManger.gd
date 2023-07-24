extends Node2D

#vars ext
var spawnPoints = null
export var dif = 0
export var kills = 0
var bossFight = false
#onready vars
onready var fly = preload("res://enemy/fly.tscn")
onready var wasp = preload("res://enemy/wasp.tscn")
onready var bossToad = preload("res://enemy/ToadBoss.tscn")
onready var turtle = preload("res://enemy/turtle.tscn")
onready var HealthPack = preload("res://player/Health.tscn")
#signals
signal addScore
signal BasicScore
signal BetterScore
signal BestScore
signal BossScore

func _ready():
	kills = 0
	
	
	randomize()
	spawnPoints = $spawnPos.get_children()
	$Timer.start()
	$HealthTimer.start()
	diff()



func addEnemy():#CAPS FOR SPAWNED ENEMY DUMD DUMD
	#if kills == 50:
		#bossFight = true
		#var BossSpawnpos = $BossSpawnPoint.position
		#var BossToad = bossToad.instance()
		#BossToad.position = BossSpawnpos
		#add_child(BossToad)
		#BossToad.connect("BossScore",self,"Boss")
		
		#$Timer2.start()
		
	if bossFight == false:
		if dif < 4:
			var positions = randi() % spawnPoints.size()
			var Fly = fly.instance()
			Fly.global_position = spawnPoints[positions].global_position 
			Fly.connect("BasicScore",self,"Basic")
			add_child(Fly)
		if dif >= 2 :
			var positions2 = randi() % spawnPoints.size()
			var Wasp = wasp.instance()
			Wasp.global_position = spawnPoints[positions2].global_position 
			add_child(Wasp)
			Wasp.connect("BetterScore",self,"Better")
		if dif >= 4:
			var positions3 = randi() % spawnPoints.size()
			var Tur = turtle.instance()
			Tur.global_position = spawnPoints[positions3].global_position
			add_child(Tur)
			Tur.connect("BestScore",self,"Best")

func Basic():
	if bossFight == false:
		emit_signal("BasicScore")
func Better():
	if bossFight == false:
		emit_signal("BetterScore")
func Best():
	if bossFight == false:
		emit_signal("BestScore")
func Boss():
	emit_signal("BossScore")
	bossFight = false


func score():
	emit_signal("addScore")
	
func _on_Timer_timeout():
	if bossFight == false:
		addEnemy()
		diff()
		print(kills)
	$Timer.start()

func diff():
	if kills >= 0:
		$Timer.set_wait_time(2)
		$HealthTimer.set_wait_time(20)
	if kills >= 10:
		dif = 1
		$Timer.set_wait_time(1.8)
		$HealthTimer.set_wait_time(20)
	if kills >= 25:
		dif = 2
		$Timer.set_wait_time(1.5)
		$HealthTimer.set_wait_time(30)
	if kills >= 50:
		dif = 3
		$Timer.set_wait_time(1)
		$HealthTimer.set_wait_time(35)
	if kills >= 80:
		dif = 4
		$Timer.set_wait_time(0.8)
		$HealthTimer.set_wait_time(40)
	if kills >= 110:
		dif = 5
		$Timer.set_wait_time(0.4)
		$HealthTimer.set_wait_time(45)


func _on_world_kill():
	kills += 1


func _on_BossEneterTimer_timeout():
	pass


func _on_Timer2_timeout():
	var positions4 = randi() % spawnPoints.size()
	var heart = HealthPack.instance()
	heart.global_position = spawnPoints[positions4].global_position
	add_child(heart)
	

extends Node2D

signal obstacle_created(obs)

onready var timer = $Timer

var Obstacle = preload("res://environment/Obstacle.tscn")

func _ready():
	randomize()

func _on_Timer_timeout():
	spawn_obstacle()
	
func spawn_obstacle():
	var obstacle = Obstacle.instance()
	obstacle.position.y = randi() % 400 + 150 # 150 - 550
	add_child(obstacle)
	emit_signal("obstacle_created", obstacle)

func start():
	timer.start()
	
func stop():
	timer.stop()

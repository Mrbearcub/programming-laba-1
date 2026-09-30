class_name Level1 extends Node2D

@onready var spawn_points = $SpawnPoints.get_children()
#Загружаем все сцены
const PLAYER = preload("uid://bv114qnw8el68")
const FAST_ENEMY = preload("uid://0dwsfocc05rt")
const SHOOTER_ENEMY = preload("uid://cxn1spawdop0d")

#Спавним игрока
func _ready() -> void:
	var player_instance = PLAYER.instantiate()
	add_child(player_instance)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

#Сигнал таймера
func _on_enemy_spawn_timer_timeout():
	spawn_enemy() #Выносим в отдельную функцию, потому что я уже привык так делать на ЕГЭ


func spawn_enemy():
	var enemy #Потом зададим
	if randi() % 2 == 0: #Рандомайзер с шансом 50 на 50
		enemy = FAST_ENEMY.instantiate()
	else:
		enemy = SHOOTER_ENEMY.instantiate()
	var spawn_point = spawn_points.pick_random() #Берем рандомную точку спавна и присваиваем ее расположение врагу в след строчке
	enemy.global_position = spawn_point.global_position
	add_child(enemy) #Спавним

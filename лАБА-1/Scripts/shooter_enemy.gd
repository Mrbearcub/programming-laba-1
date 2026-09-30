class_name ShooterEnemy extends Enemy

@export var speed: float = 80.0
@export var stopping_distance: float = 300.0
const BULLET = preload("uid://bk643irhfrn8g")

var player: Node2D


func _ready():
	super._ready()

	player = get_tree().get_first_node_in_group("player")

#Передвижение + система остановки игрока на определенном растоянии
func _physics_process(delta):
	if player == null: #Проверка, что игрок не умер
		return
	var distance = global_position.distance_to(player.global_position) #Смотрим растояние до  игрока
	if distance > stopping_distance: #Проверяем допустимое
		var direction = global_position.direction_to(player.global_position) #Где игрок
		velocity = direction * speed #Остальное стандарт
	else:
		velocity = Vector2.ZERO #Стоп

	move_and_slide()


func _on_shoot_timer_timeout():
	shoot()


func shoot():
	if player == null:
		return
	var bullet = BULLET.instantiate()
# Передаем параметры пуле
	bullet.global_position = $Marker2D.global_position #У меня почему-то не получилось как в прошлый раз сделать, пуля тупо крашила игру, поэтому сделал через маркер, а старую мне лень менять было
	bullet.direction = global_position.direction_to(player.global_position)

	add_sibling(bullet)

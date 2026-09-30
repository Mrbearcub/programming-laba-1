class_name FastEnemy extends Enemy

@export var speed: float = 250.0
@export var damage: int = 20

var player: Node2D #Задаем пустым, в реди пропишем, чтоб присваивалось, когда враг появляется

func _ready():
	super._ready() #вызывает _ready у класса enemy
	player = get_tree().get_first_node_in_group("player") #Ищет игрока на сцене

func _physics_process(delta) -> void:
	if player == null:
		return
	var direction = global_position.direction_to(player.global_position) #Направляет на игрока

	velocity = direction * speed #Задаем скорость и направление
	move_and_slide() #функция CharacterBody2D, чтобы облегчить жизнь

#Аналогично как у пули врага
func _on_damage_area_body_entered(body):
	if body.is_in_group("player"):
		body.take_damage(damage)
		queue_free()

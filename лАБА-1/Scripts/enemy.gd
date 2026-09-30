class_name Enemy extends CharacterBody2D #Сделали отдельный класс для врагов

@export var max_health: int = 100 #Максимальное хп
var health: int #Текущее хп

func _ready() -> void: 
	health = max_health #Присваиваем текущее хп по умалчанию фулл


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

#Аналогично как у игрока
func take_damage(damage: int):
	health -= damage
	health = clamp(health, 0, max_health)

	if health <= 0:
		die()

#Убирает со сцены
func die():
	self.queue_free()

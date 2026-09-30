class_name Barrel extends StaticBody2D

#Аналогично Enemy
@export var max_health: int = 40
var health: int


func _ready():
	health = max_health


func take_damage(damage: int):
	health -= damage

	if health <= 0:
		destroy()


func destroy():
	queue_free()

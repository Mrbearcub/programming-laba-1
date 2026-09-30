class_name EnemyBullet extends Sprite2D

@export var speed_of_flight: float = 1000.0
@export var damage: int = 10
var direction: Vector2 = Vector2.ZERO #Потом присвоим извне


func _process(delta: float) -> void:
	global_position += direction * speed_of_flight * delta #Движение пули

#Аналогично как у пули игрока
func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("Level"):
		self.queue_free()
		
#Аналогично как у пули игрока, только урон по игроку
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.take_damage(damage)
		self.queue_free()

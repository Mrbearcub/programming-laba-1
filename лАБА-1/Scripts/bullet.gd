class_name Bullet extends Sprite2D

@export var speed_of_flight : int = 2000
@export var damage : int = 100

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += Vector2.UP.rotated(rotation + PI/2) * speed_of_flight * delta #Высчитываем траекторию пули

#Уничтожение пуль об край карты
func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("Level"):
		self.queue_free()


#Добавляет урон разным типам объектов
func _on_area_2d_body_entered(body):
	if body.is_in_group("enemy"): #Проверяет правильный ли объект
		body.take_damage(damage) #Наносит урон врагу
		self.queue_free() #уничтожение пули
	if body.is_in_group("destructible"): #Проверяет правильный ли объект
		body.take_damage(damage) #Наносит урон разрушаеиыи объектам
		self.queue_free() #уничтожение пули

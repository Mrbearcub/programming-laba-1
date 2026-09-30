class_name Player extends CharacterBody2D

@export var max_health: int = 100 #Максимальное здоровье игрока
var health: int = 100 #Текущее здоровье игрока
@export var speed : int = 500
@export var cooldown_in_seconds : float = 0.5
const BULLET = preload("uid://b6osavqjc02ep") #Загружаем сцену
@onready var shoot_cooldown_timer : Timer = $Timer
@onready var health_bar: ProgressBar = $HealthBar #Связывает значение переменной с прогресс-баром на сцене

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	health_bar.max_value = max_health
	health_bar.value = health # Присваивает значения хп бару


# Called every frame. 'delta' is the elapsed time since the previous frame.
#Настраиваем управление
func _process(delta: float) -> void:
	if Input.is_action_pressed("move_up"):
		position.y -= speed * delta
	if Input.is_action_pressed("move_down"):
		position.y += speed * delta
	if Input.is_action_pressed("move_right"):
		position.x += speed * delta
	if Input.is_action_pressed("move_left"):
		position.x -= speed * delta
	
	look_at(get_global_mouse_position()) #Смотреть на мышку

func _input(event: InputEvent) -> void:
	if event is InputEventKey: 
		if event.is_pressed() and event.keycode == KEY_ESCAPE: #Выход из игры
			get_tree().quit()
	if event.is_pressed() and event.is_action("shoot"):
		if shoot_cooldown_timer.is_stopped(): #Проверка кулдауна
			var bullet_instance = BULLET.instantiate()
			add_sibling(bullet_instance)
			bullet_instance.rotation = rotation #Передаем параметры
			bullet_instance.position = position
			shoot_cooldown_timer.start(cooldown_in_seconds) #Начинаем кулдуан
			
#Функция отвечающая за получения игроком урона, будет вызываться извне
func take_damage(damage: int): 
	health -= damage
	health = clamp(health, 0, max_health) #Ограничивает хп, чтобы оно не ушло в -
	health_bar.value = health #Присваивает хп бару нужное значение
	if health <= 0: #Вызов смерти, при <=0 хп
		die()

#Заготовка
func die():
	pass 

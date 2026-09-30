class_name Spikes extends Sprite2D

@export var damage: int = 20

#Наносит урон игроку
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.take_damage(damage)

extends StaticBody2D

var health := 10

func take_damage(damage: int) -> void:
	health -= damage

func _process(delta: float) -> void:
	if health <= 0:
		queue_free()

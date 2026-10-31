extends CharacterBody2D

enum PlayerDirection {
	Right,
	Left,
}
@onready var animation: AnimatedSprite2D = $AnimatedSprite2D
@onready var hurtbox: Hurtbox = $Hurtbox
@onready var hurtbox_collision_shape: CollisionShape2D = $Hurtbox/CollisionShape2D
@onready var attack_cooldown: Timer = $AttackCooldown
@onready var attack_duration: Timer = $AttackDuration

@export var inventory: Inventory

var hurtbox_offset: Vector2
var can_attack: bool

const SPEED = 250
const FRICTION = 0.85

func _ready() -> void:
	hurtbox_offset = hurtbox.position
	can_attack = true

func _physics_process(delta: float) -> void:
	
	var direction := Input.get_vector("move_left", "move_right", "move_up", "move_down").normalized()
	
	if direction.x > 0:
		update_hurtbox_direction(PlayerDirection.Right)
	elif direction.x < 0:
		update_hurtbox_direction(PlayerDirection.Left)
	
	velocity = (velocity * FRICTION) + (2 * direction * SPEED * delta)
	
	if direction.x:
		if direction.x >0:
			animation.flip_h = false
		else:
			animation.flip_h = true
	
	if Input.is_action_pressed("attack") && can_attack == true:
		attack()
	
	move_and_slide()
	
	
func update_hurtbox_direction(direction: PlayerDirection) -> void:
	if direction == PlayerDirection.Right:
		hurtbox.position = hurtbox_offset
	else:
		hurtbox.position = Vector2(-hurtbox_offset.x, hurtbox_offset.y)

func attack() -> void:
	attack_duration.start()
	hurtbox_collision_shape.disabled = false
	can_attack = false

func _on_attack_cooldown_timeout() -> void:
	can_attack = true


func _on_attack_duration_timeout() -> void:
	hurtbox_collision_shape.disabled = true
	attack_cooldown.start()
	

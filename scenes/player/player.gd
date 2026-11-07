extends CharacterBody2D

@export var speed := 160.0
@onready var nozzle: Node2D = $Nozzle
@onready var sprite: Sprite2D = $Sprite2D  

func _physics_process(_delta: float) -> void:
	var direction := Input.get_vector("move_left","move_right","move_up","move_down")
	velocity = direction * speed
	move_and_slide()
	
	nozzle.look_at(get_global_mouse_position())
	sprite.flip_h = get_global_mouse_position().x < global_position.x

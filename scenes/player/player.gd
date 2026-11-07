extends CharacterBody2D
## プレイヤー（掃除機を背負った探検家）。WASD で移動し、ノズルはマウスの方向を向く。

@onready var sprite: Sprite2D = $Sprite2D
@onready var nozzle: Node2D = $Nozzle


func _physics_process(_delta: float) -> void:
	# 押されているキーから「進みたい方向」を作る。長さは最大1（斜めでも1を超えない）
	var direction := Input.get_vector("move_left", "move_right", "move_up", "move_down")

	# TODO(human): 速さを決めて、direction から velocity を決める
	#   - 速さは、このファイルの上のほうに @export var speed ... として作るとインスペクターから調整できる
	#   - velocity は「1秒あたり何ピクセル進むか」を表す Vector2

	move_and_slide()

	nozzle.look_at(get_global_mouse_position())

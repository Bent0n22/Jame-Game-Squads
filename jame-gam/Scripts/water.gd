extends TileMapLayer

@export var move_distance: float = 16.0
@export var lerp_speed: float = 10.0
@onready var killzone: CollisionShape2D = $"../killzone/CollisionShape2D"

var time_accumlator: float = 0.0
@onready var target_y: float = position.y

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	time_accumlator += delta
	
	if time_accumlator >= 1.0:
		target_y -= move_distance
		killzone.position.y -= move_distance
		time_accumlator -= 1.0
		
	position.y = lerp(position.y, target_y, lerp_speed * delta)

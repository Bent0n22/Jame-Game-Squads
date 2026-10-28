extends Camera2D

@export var randomStrength: float = 5.0
@export  var shakeFade: float = 5.0
@onready var character_body_2d: CharacterBody2D = $"../.."
var was_in_air: bool = false

var rng = RandomNumberGenerator.new()

var shake_strength: float = 0.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func apply_shake():
	shake_strength = randomStrength

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	character_body_2d.move_and_slide()
	if character_body_2d.is_on_floor():
		if was_in_air:
			_on_landed()
			was_in_air = false
	else:
		was_in_air = true
		
	if shake_strength > 0:
		shake_strength = lerpf(shake_strength, 0, shakeFade * delta)
		
		offset = randomOffset()

func randomOffset() -> Vector2:
	return Vector2(rng.randf_range(-shake_strength, shake_strength), rng.randf_range(-shake_strength, shake_strength))

func _on_landed() -> void:
	apply_shake()

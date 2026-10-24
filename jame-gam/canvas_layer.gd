extends CanvasLayer

@onready var fade: ColorRect = $ColorRect # Update node name if different

func _ready() -> void:
	fade.modulate.a = 1.0
	fade.mouse_filter = Control.MOUSE_FILTER_STOP
	fade_in(2.0)

func fade_in(duration: float = 2.0) -> void:
	var tween := create_tween()
	tween.tween_property(fade, "modulate:a", 0.0, duration)

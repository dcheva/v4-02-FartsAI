extends Node2D


func _ready() -> void:
	pass


func _process(delta: float) -> void:
	pass


func _unhandled_input(event):
	if event is InputEventKey:
		if event.is_action_pressed("alt_enter"):
			get_window().mode = Window.MODE_EXCLUSIVE_FULLSCREEN if (!((get_window().mode == Window.MODE_EXCLUSIVE_FULLSCREEN) or (get_window().mode == Window.MODE_FULLSCREEN))  ) else Window.MODE_WINDOWED

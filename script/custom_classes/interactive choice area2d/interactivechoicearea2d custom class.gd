extends Area2D
class_name InteractiveChoiceArea2D

@export_file("*.tscn") var next_choiced_scene

func _input_event(viewport: Viewport, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT:
		_go_to_choiced_scene()

func _go_to_choiced_scene():
	if next_choiced_scene:
		get_tree().change_scene_to_file(next_choiced_scene)

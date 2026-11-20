extends AnimatedSprite2D
class_name AnimatedCutsceneSprite2D_base

func _ready() -> void:
	#print("AnimatedCutsceneSprite2D_base is ready")
	#_fit_frame_size_to_viewport()
	if not sprite_frames_changed.is_connected(_on_spriteframe_changed):
		sprite_frames_changed.connect(_on_spriteframe_changed)
	if not animation_finished.is_connected(_on_animation_finished):
		animation_finished.connect(_on_animation_finished)
	
	
func _fit_frame_size_to_viewport(spritefr:SpriteFrames):
	if sprite_frames == null:
		return
		
	if spritefr.get_frame_count(spritefr.get_animation_names()[0]) > 0:
		var texture : Texture2D = spritefr.get_frame_texture(
			spritefr.get_animation_names()[0],
			0
		)

		var viewport_size: Vector2 = get_viewport_rect().size
		var image_size: Vector2 = texture.get_size()

		var scale_x: float = viewport_size.x / image_size.x
		var scale_y: float = viewport_size.y / image_size.y

		scale = Vector2(scale_x, scale_y)
		position = viewport_size / 2

func _on_animation_finished():
	get_tree().change_scene_to_file('res://scenes/head into town ch2/kidbro shooting/notshane miss the shot.tscn')

func _on_spriteframe_changed():
	_fit_frame_size_to_viewport(sprite_frames)

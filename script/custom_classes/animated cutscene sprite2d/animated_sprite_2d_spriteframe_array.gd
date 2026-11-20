extends AnimatedCutsceneSprite2D_base
class_name AnimatedCutsceneSprite2D_sprite_array

signal sprite_array_finished

@export_file_path("*.tscn") var next_scene_path

@export var sprite_array : Array[SpriteFrames]
var index_sprite_array : int = 0

func _ready() -> void:
	super()
	if not sprite_array_finished.is_connected(_on_sprite_array_finished):
		sprite_array_finished.connect(_on_sprite_array_finished)
	#print("FUUUUUCK I HAVE TWO _on_FINSIHED_ AAAAHA HTEY ARE OVERLAPING WHEN ANIAMTION FNINISHED AHHHHHHHH HAWIHJDOI JAOWIDN OIAWNHOIFHAOIWJPDOIAJWIOd")
	#print("sprite array is ready")
	if sprite_array.size() > 0:
		if sprite_array[index_sprite_array] is SpriteFrames:
			_spriteframe_changer_based_on_array()

func _spriteframe_changer_based_on_array():
	#change it
	sprite_frames = sprite_array[index_sprite_array]
	_configure_spriteframes()
	#play it
	play()

func _on_animation_finished():
		_next_animation()
		
func _next_animation():
	if sprite_array.size()-1 > index_sprite_array:
		index_sprite_array += 1
	
		if sprite_array[index_sprite_array] is SpriteFrames:
			_spriteframe_changer_based_on_array()
			_configure_spriteframes()
	else:
		sprite_array_finished.emit()

func _configure_spriteframes():
	_fit_frame_size_to_viewport(sprite_frames)
	if sprite_frames:
		#set loop mode false
		sprite_frames.set_animation_loop_mode(sprite_frames.get_animation_names()[0],SpriteFrames.LOOP_NONE)
	
	if sprite_array:
		if sprite_array.size() > 0:
			sprite_array[0].set_animation_loop_mode(sprite_frames.get_animation_names()[0],SpriteFrames.LOOP_NONE)
	
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed('ui_accept'):
		_next_animation()
		print(index_sprite_array)

func _on_sprite_array_finished():
	print("parent empty sprite array finished")
	if next_scene_path:
		get_tree().change_scene_to_file(next_scene_path)

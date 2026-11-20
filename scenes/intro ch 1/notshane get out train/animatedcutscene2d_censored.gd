extends AnimatedCutsceneSprite2D_sprite_array
class_name AnimatedCutsceneSprite2D_censored

#@export var censored_sprite_
#Dictionary
#Dictionary[String,Array[SpriteFrames]]
@export var censored_no_gore_sprite : SpriteFrames
@export var censored_no_death_sprite : SpriteFrames

func _ready() -> void:
	super()
	#print("censord is ready")
	_configure_spriteframes()
	_change_censored_sprite()
	play()
	
func _change_censored_sprite():
	if censored_no_death_sprite:
		censored_no_death_sprite.set_animation_loop_mode(sprite_frames.get_animation_names()[0],SpriteFrames.LOOP_NONE)
	if censored_no_gore_sprite:
		censored_no_gore_sprite.set_animation_loop_mode(sprite_frames.get_animation_names()[0],SpriteFrames.LOOP_NONE)
		
	match SettingsAutoload.Censor_Type:
		0:
			pass
		1:
			sprite_frames = censored_no_gore_sprite
			print("no gore")
		2:
			sprite_frames = censored_no_death_sprite
			print("no death")

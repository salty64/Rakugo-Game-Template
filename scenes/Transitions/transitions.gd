extends CanvasLayer

@onready var texture = $TextureRect
@onready var Transition_Animate: AnimationPlayer = $AnimationPlayer


const CIRCLE_MASK = preload("res://scenes/Transitions/Shaders/Circle_mask.gdshader")
const SQUARE_MASK = preload("res://scenes/Transitions/Shaders/Square_mask.gdshader")
const SCREEN_MASK = preload("res://scenes/Transitions/Shaders/Screen_mask.gdshader")
const SPRITE_MASK = preload("res://scenes/Transitions/Shaders/Sprite_mask.gdshader")
const SWIPE_MASK = preload("res://scenes/Transitions/Shaders/Swipe_Mask.gdshader")
const DIAMOND = preload("res://scenes/Transitions/Shaders/Diamond.gdshader")
const LINE = preload("res://scenes/Transitions/Shaders/Line.gdshader")

func _ready():
	transition("Swipe")
	await Transition_Animate.animation_finished
	transition("Square")
	await Transition_Animate.animation_finished
	transition("Circle")
	await Transition_Animate.animation_finished
	transition("Sprite")
	await Transition_Animate.animation_finished
	transition("Diamond")
	await Transition_Animate.animation_finished
	transition("Line")

func screen_ratio ():
	var x = $TextureRect.get_size() 
	return x[1]/x[0]

func transition (Transition_Name:String) :
	match Transition_Name:

		"Swipe":
			texture.material.shader = SWIPE_MASK

		"Square":
			texture.material.shader = SQUARE_MASK

		"Circle":
			texture.material.shader = CIRCLE_MASK
			texture.material.set("shader_parameter/size_ratio", screen_ratio())

		"Sprite":
			texture.material.shader = SPRITE_MASK
		
		"Diamond":
			texture.material.shader = DIAMOND
		
		"Line":
			texture.material.shader = LINE

	$AnimationPlayer.play(Transition_Name)

extends Node2D
@export var available_keys: Array[String] = ["Q", "W", "E"]  # Define available actions
@export var selected_key: String = "Q"  # Select which action to use

@export var audio_file: Resource
@export var animation: Animation

func _ready() -> void:
	$AudioStreamPlayer2D.stream = audio_file
	

func _input(event):
	if selected_key != "" and event.is_action_pressed(selected_key):
		$AudioStreamPlayer2D.play()
		$AnimatedSprite2D.play(selected_key)
	elif selected_key != "" and event.is_action_released(selected_key):
		$AudioStreamPlayer2D.stop()
		$AnimatedSprite2D.pause()
		

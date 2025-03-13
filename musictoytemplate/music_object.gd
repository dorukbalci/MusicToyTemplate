extends Node2D
@export var available_keys: Array[String] = ["Q", "W", "E"]  # Define available actions
@export var selected_key: String = "Q"  # Select which action to use

@export var audio_file: Resource


@export var one_shot = false


@export_range(0, 10) var volume: float = 1:  
	set = set_volume  # Updates the volume when changed in the editor
func _ready() -> void:
	$AudioStreamPlayer2D.stream = audio_file

# Converts a value (0-100) to decibels
func linear_to_db(value: float) -> float:
	if value <= 0:
		return -80.0  # Silence
	return lerpf(-80.0, 0.0, value / 100.0)

# Sets the volume and updates the AudioStreamPlayer
func set_volume(value: float):
	volume = value  # Store the value
	if $AudioStreamPlayer2D:
		$AudioStreamPlayer2D.volume_db = linear_to_db(value)

func _input(event):
	if selected_key != "" and event.is_action_pressed(selected_key):
		$AudioStreamPlayer2D.play()
		$AnimatedSprite2D.play(selected_key)
	elif selected_key != "" and event.is_action_released(selected_key):
		$AudioStreamPlayer2D.stop()
		$AnimatedSprite2D.pause()
		if one_shot:
			$AnimatedSprite2D.stop()
		
		

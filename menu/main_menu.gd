class_name MainMenu
extends Control

@onready var start_button = $MarginContainer/HBoxContainer/VBoxContainer/StartButton as Button
@onready var exit_button = $MarginContainer/HBoxContainer/VBoxContainer/ExitButton as Button
@onready var start_level = preload("res://levels/level_1.tscn") as PackedScene

@onready var resultText = $MarginContainer/VBoxContainer/Label
@onready var finalScore = $MarginContainer/VBoxContainer/FinalScore
@onready var score = $UI/ScoreLabel
# --> timer runs out --> call displayFinalScore and access score from ScoreLabel

func _ready():
	start_button.button_down.connect(on_start_pressed)
	exit_button.button_down.connect(on_exit_pressed)

func on_start_pressed() -> void:
	get_tree().change_scene_to_packed(start_level)

func on_exit_pressed() -> void:
	get_tree().quit()

func displayFinalScore() -> void:
	if score >= 2:
		resultText.text = "You Win!"
	else:
		resultText.text = "You Loose!"
		
	finalScore.text = "Final Score %d" % score

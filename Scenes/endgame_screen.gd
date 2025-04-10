extends Node2D

@onready var stata = $Statistics

func ending(score, maximum_score):
	stata.text = "Congratulations!\nYou have collected " + str(score) + " coins / ";
	stata.text += str(maximum_score) + " coins\nYou have been " + str(round((float(score) / float(maximum_score)) * 100)) + "% efficient"

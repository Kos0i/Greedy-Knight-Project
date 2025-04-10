extends Node

var score = 0;
@onready var ScoreLable = $ScoreLabel;

func add_score(points):
	score += points;
	ScoreLable.text = "Your score is " + str(score);


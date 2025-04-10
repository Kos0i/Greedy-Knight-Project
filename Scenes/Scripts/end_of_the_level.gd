extends Area2D

@onready var camera = $"../Camera2D";
@onready var last_screen = $"../EndgameScreen";
@onready var level_manager = $"../LevelManager";

@onready var bags = $"../money";
var dynamic_prog_array = [];
var maximum_score = 0;

func _ready():
	var i = 0;
	var money_bags = bags.get_children(0);
	while (i < 180):
		dynamic_prog_array.append(0);
		i += 1;
	print(dynamic_prog_array[0])
	i = 1;
	dynamic_prog_array[0] = 0;
	for money in money_bags:
		if (i < 18):
			dynamic_prog_array[i] = dynamic_prog_array[i - 1] + money.value;
		elif (i % 18 == 0):
			dynamic_prog_array[i] = dynamic_prog_array[i - 18];
		else:
			dynamic_prog_array[i] = max(dynamic_prog_array[i - 1], dynamic_prog_array[i - 18]) + money.value;
		i += 1;	

func _on_body_entered(body):
	maximum_score = max(dynamic_prog_array[178], dynamic_prog_array[179-18]);
	camera.move_local_x(-200, false);
	camera.move_local_y(-1500, false);
	last_screen.ending(level_manager.score, maximum_score);

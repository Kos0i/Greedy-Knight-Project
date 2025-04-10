extends Area2D
@onready var level_manager = $"../../LevelManager"

var value = 0;
var rng = RandomNumberGenerator.new()

func _ready():
	value = rng.randi_range(0, 100);
	add_to_group("Money Bags");

func _on_body_entered(body):
	level_manager.add_score(value);
	queue_free();

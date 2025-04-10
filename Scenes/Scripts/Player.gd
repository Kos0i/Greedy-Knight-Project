extends CharacterBody2D

#Подгружаем тайл-мапу
@onready var tile_map = $"../TileMapTerrain";
@onready var sprite = $AnimatedSprite2D;
var is_moving = false;

func _physics_process(delta):
	if (is_moving == false):
		return;
	
	if (global_position == sprite.global_position):
		is_moving = false;
		return;
		
	sprite.global_position = sprite.global_position.move_toward(global_position, 2);

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (is_moving):
		sprite.play("moving");
		return;
	else:
		sprite.play("idle");
	
	if (Input.is_action_pressed("Down")):
		move(Vector2.DOWN);
	elif (Input.is_action_just_pressed("Right")):
		move(Vector2.RIGHT);
	elif (Input.is_action_just_pressed("Restart")):
		get_tree().reload_current_scene();
	elif  (Input.is_action_just_pressed("Exit")):
		get_tree().quit(); 


func move(direction : Vector2):
	#Получаем текущую позицию (в тайле)
	var current_tile: Vector2i = tile_map.local_to_map(global_position);
	
	var next_tile: Vector2i = Vector2i(
		current_tile.x + direction.x,
		current_tile.y + direction.y
	)
	
	var tile_data: TileData = tile_map.get_cell_tile_data(0, next_tile);

	if (tile_data == null):
		return;
		
	is_moving = true;
	
	global_position = tile_map.map_to_local(next_tile);
	
	sprite.global_position = tile_map.map_to_local(current_tile);

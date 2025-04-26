extends CollisionShape2D
# 1. Добавьте StaticBody2D как дочерний нод карты
# 2. Добавьте CollisionShape2D с прямоугольной формой

@export var map_size := Vector2(1000, 1000)
@export var boundary_width := 50.0

func _ready():
	var boundary = StaticBody2D.new()
	add_child(boundary)
	
	# Создаем 4 прямоугольника по краям карты
	var sides = ["top", "bottom", "left", "right"]
	for side in sides:
		var shape = RectangleShape2D.new()
		var collision = CollisionShape2D.new()
		
		match side:
			"top", "bottom":
				shape.size = Vector2(map_size.x + boundary_width*2, boundary_width)
				collision.position.y = -boundary_width/2 if side == "top" else map_size.y + boundary_width/2
			"left", "right":
				shape.size = Vector2(boundary_width, map_size.y)
				collision.position.x = -boundary_width/2 if side == "left" else map_size.x + boundary_width/2
		
		collision.shape = shape
		boundary.add_child(collision)

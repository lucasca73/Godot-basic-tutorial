extends Area2D

var speed = 200
var direction = Vector2()
var width
var height
var dead = false
var hit = false
var clicks = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	width = get_viewport_rect().size.x
	height = get_viewport_rect().size.y
	born()

func born():
	position = get_viewport_rect().size/2
	direction.x = rand_range(-1,1)
	direction.y = rand_range(-1,1)
	direction = direction.normalized()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if dead:
		return
	# Updating position
	position += direction * speed * delta
	
	# Reflect bouncing on the edges
	if position.x < 0 or position.x > width:
		direction.x = -direction.x

	if position.y < 0 or position.y > height:
		direction.y = -direction.y
	

func _on_Area2D_input_event(viewport, event, shape_idx):
	if dead:
		return
		
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
		
		print('handle disk click')
		born()
		position.x = rand_range(1, width -1)
		position.y = rand_range(1, height -1)
		speed += 10
		speed *= 1.01
		hit = true
		$HitSound.play(0)
		clicks += 1

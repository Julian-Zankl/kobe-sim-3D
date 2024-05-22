extends Area3D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

# gets emitted when a rigid body (ball) enters the collision shape inside the hoop
signal scored

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	body_entered.connect(_on_Area_body_entered)

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func _on_Area_body_entered(body):
	if body is RigidBody3D:
		get_node("../AnimationPlayer").play("touched")
		#scored.emit()
		emit_signal("scored")
		
	

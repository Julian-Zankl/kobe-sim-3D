extends RigidBody3D

var picked_up
var holder

func pick_up(player):
	holder = player

	if picked_up:
		leave()
	else:
		carry()

func _process(delta):
	if picked_up:
		set_global_transform(holder.get_node("Yaw/Camera3D/pickup_pos").get_global_transform())

func carry():
	$CollisionShape3D.set_disabled(true)
	holder.carried_object = self
	picked_up = true

func leave():
	$CollisionShape3D.set_disabled(false)
	holder.carried_object = null
	picked_up = false

func throw(power):
	leave()
	apply_impulse(holder.look_vector * Vector3(power, power, power), Vector3())
	

# Remove Ball when scored
func _on_area_3d_scored():
	queue_free()

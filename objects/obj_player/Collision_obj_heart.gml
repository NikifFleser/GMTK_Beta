/// @description Insert description here
// You can write your code in this editor

obj_camera.screenshake = 8 + irandom(4)
var dir = point_direction(x, y, other.x, other.y) + random_range(-5, 5);
var str = kick_strength;
dash_ready = true
with other
	{
	physics_apply_impulse(x, y, lengthdir_x(str, dir), lengthdir_y(str, dir))
	}
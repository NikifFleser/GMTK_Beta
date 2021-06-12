/// @description Insert description here
// You can write your code in this editor

var xx = lengthdir_x(spd, dir);
var yy = lengthdir_y(spd, dir);
with other
	{
	physics_apply_impulse(x, y, xx, yy)
	}

instance_destroy()
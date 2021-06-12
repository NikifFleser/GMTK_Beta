if instance_exists(obj_player)
	{
	x = lerp(obj_player.x, obj_heart.x, 0.3)
	y = lerp(obj_player.y, obj_heart.y, 0.3)
	}

	
if !global.pause
	{
	var ww = global.zoom * global.sw;
	var wh = global.zoom * global.sh;
	
	if mouse_wheel_down()
		{
		zoom = clamp(zoom - 1, 1, 8)
		
		change_view(0.2, ww div zoom, wh div zoom)
		}
	else if mouse_wheel_up()
		{
		zoom = clamp(zoom + 1, 1, 8)
		
		obj_camera.change_view(0.2, ww div zoom, wh div zoom)
		}
	}

if global.vw != ew or global.vh != eh
	{
	change_view(view_factor, ew, eh)
	ew = round(ew)
	eh = round(eh)
	}
	
if !global.pause
	{
	global.gx = x
	global.gy = y
	global.gw = global.vw
	global.gh = global.vh
	}

camera_set_view_size(cam, global.vw, global.vh)
var shakedir = irandom(360);
camera_set_view_pos(cam, x - global.vw/2 + lengthdir_x(screenshake, shakedir), y - global.vh/2 + lengthdir_y(screenshake, shakedir))
screenshake = screenshake * dropoff
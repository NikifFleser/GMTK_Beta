function scr_set_globals(){
	#region views
	
	scr_calculate_views(320, 180)
	
	#endregion
	
	global.pause = false
	
	#region inputs
	global.left = ord("A")
	global.right = ord("D")
	global.up = ord("W")
	global.down = ord("S")
	#endregion
}

function scr_calculate_views(w, h){
	global.sw = w  // standard view
	global.sh = h

	global.vw = w  // active view
	global.vh = h
	
	global.gw = w // game view
	global.gh = h
}

function scr_change_resolution() {

	var sw = display_get_width();
	var sh = display_get_height();

	global.zoom = min(sw div global.sw, sh div global.sh);

	window_set_size(global.sw * global.zoom, global.sh * global.zoom)
	surface_resize(application_surface, global.sw * global.zoom, global.sh * global.zoom)
	display_set_gui_size(global.sw * global.zoom, global.sh * global.zoom)
	
	if instance_exists(obj_camera)
		{
		obj_camera.change_view(1, global.sw, global.sh)
		}

	alarm[0] = 1  //center window 
}
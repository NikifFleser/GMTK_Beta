//variables

spd = 4
screenshake = 0
dropoff = 0.95

//functions

function change_view(factor, ew, eh){
	id.ew = ew
	id.eh = eh
	id.view_factor = factor
	
	global.vw = lerp(global.vw, ew, factor)
	global.vh = lerp(global.vh, eh, factor)
	
	if abs(global.vw - ew) <= 1
		{
		global.vw = ew
		}
	if abs(global.vh - eh) <= 1
		{
		global.vh = eh
		}
}

//inits

zoom = global.zoom

global.gx = 0
global.gy = 0

view_factor = 1
ew = global.vw
eh = global.vh

cam = view_camera[0]

view_enabled = true
view_visible[0] = true
obj_camera.change_view(1, global.sw, global.sh)


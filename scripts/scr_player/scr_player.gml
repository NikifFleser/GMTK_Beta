// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function player_move(){
	var dir = point_direction(x, y, mouse_x, mouse_y);
	spd = lerp(min_spd, max_spd, min(1, point_distance(x, y, obj_heart.x, obj_heart.y) / dist_spd))
	if mouse_check_button(mb_left)
		{
		phy_linear_velocity_x = lerp(phy_linear_velocity_x, lengthdir_x(spd, dir), 0.05)
		phy_linear_velocity_y = lerp(phy_linear_velocity_y, lengthdir_y(spd, dir), 0.05)
		//physics_apply_impulse(x, y, lengthdir_x(spd, dir), lengthdir_y(spd, dir))
		}
	else
		{
		phy_linear_velocity_x = lerp(phy_linear_velocity_x, 0, 0.05)
		phy_linear_velocity_y = lerp(phy_linear_velocity_y, 0, 0.05)
		}
	
	/* dash
	if mouse_check_button_pressed(mb_right) and dash_ready
		{
		dash_ready = false
		phy_linear_velocity_x = lerp(phy_linear_velocity_x, lengthdir_x(max_spd * dash_speed, dir), 0.05)
		phy_linear_velocity_y = lerp(phy_linear_velocity_y, lengthdir_y(max_spd * dash_speed, dir), 0.05)
		}*/
		
	if mouse_check_button(mb_right) and heart_pull > 0
		{
		var dir = point_direction(obj_heart.x, obj_heart.y, x, y)
		var xx = lengthdir_x(dash_speed, dir);
		var yy = lengthdir_y(dash_speed, dir);
		
		with obj_heart
			{
			physics_apply_force(x, y, xx, yy)
			}
		heart_pull -= 1
		}
	
		
	if collision_line(x, y, obj_heart.x, obj_heart.y, obj_collider, true, false)//wall breaks connection
		{
		break_connection()
		}
}

function player_dead(){
	image_blend = c_red
	image_alpha -= 0.01
}

function player_draw(){
	index += 0.02

	draw_sprite_ext(spr_shadow, 0, x, y + 56, 1 + 0.2 * sin(index), 1 + 0.2 * sin(index), 0, c_white, 0.8)
	if joined
		{
		draw_line_width_color(x, y, obj_heart.x, obj_heart.y, 4, c_blue, c_red)
		}
	draw_sprite(spr_player_flame, (index * 2) mod 4, x, y + sin(index) * 4)
	draw_sprite(sprite_index, 0, x, y + sin(index) * 4)

}

function break_connection(){
	joined = false
	alarm[0] = 90
	state = player_dead
	obj_camera.screenshake = 64
}
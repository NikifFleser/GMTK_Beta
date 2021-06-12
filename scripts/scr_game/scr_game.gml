function heart_move(){
	if point_distance(x, y, obj_goal.x, obj_goal.y) < goal_distance
		{
		var dir = point_direction(x, y, obj_goal.x, obj_goal.y)
		physics_apply_impulse(x, y, lengthdir_x(goal_force, dir), lengthdir_y(goal_force, dir))
		}
}
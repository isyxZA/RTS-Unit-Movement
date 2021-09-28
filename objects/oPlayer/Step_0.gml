/// @description Movement logic

if mouse_check_button_pressed(mb_right)
{
	//Check if the cell the unit is attempting to move to is occupied or not
	if CellEmpty(mouse_x, mouse_y)
	{
		//Tell the follow group to begin pathfinding
		var ls = ds_list_size(followList);
		for (var i = 0; i < ls; ++i)
		{
			var lu = ds_list_find_value(followList, i);
			lu.formationSize = ls;
			lu.isFollowing = false;
			lu.follow = true;
			lu.alarm[1] = -1;
		}
		//Send the unit on its merry way
		MoveUnit(waypointX, waypointY);
	}
}

if moving
{
	TrackPath();
}

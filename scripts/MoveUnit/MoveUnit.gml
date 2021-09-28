/// @description MoveUnit(xGoal, yGoal) Find a path for the unit to the goal position
/// @param xGoal x coord
/// @param yGoal y coord
function MoveUnit(xGoal, yGoal)
{
	//Clear the currently occupied cell
	mp_grid_clear_cell(global.NavGrid, cellX, cellY);
	
	//If a valid path has been found
	if mp_grid_path(global.NavGrid, path, x, y, xGoal, yGoal, true)
	{
		//Find the grid cell at the end of the path
		cellX = (xGoal - oUnitControl.gridX) div oUnitControl.cellSize;
		cellY = (yGoal - oUnitControl.gridY) div oUnitControl.cellSize;
		//Add the cell to the grid to prevent other units moving into the same position
		mp_grid_add_cell(global.NavGrid, cellX, cellY);
		//Start moving the object
		path_start(path, pSpeed, 0, 0);
		//If the object isn't already moving
		if !moving 
		{ 
			moving = true; 
			xPrev = x;
			yPrev = y;
		}
		//Begin rotation adjustments
		if alarm[0] > 0 { alarm[0] = -1; }
		alarm[0] = room_speed * 0.1;
		rotationTarget = point_direction(x, y, path_get_point_x(path, 1), path_get_point_y(path, 1));
	}
	//No valid path is available
	else
	{
		//Add the current cell back to it's original position
		mp_grid_add_cell(global.NavGrid, cellX, cellY);
	}
}
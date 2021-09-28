/// @description CellEmpty(xPos, yPos) Check if a cell is occupied or not
/// @param xPos x coord
/// @param yPos y coord
function CellEmpty(xPos, yPos)
{
	//Center position on the cell
	var cs = oUnitControl.cellSize;
	xPos = xPos div cs * cs + (cs * 0.5);
	yPos = yPos div cs * cs + (cs * 0.5);
	
	//Retrieve the cell at position
	var cX = (xPos - oUnitControl.gridX) div cs;
	var cY = (yPos - oUnitControl.gridY) div cs;
	
	//Determine if the cell is occupied
	if mp_grid_get_cell(global.NavGrid, cX, cY) != -1
	{
		waypointX = xPos;
		waypointY = yPos;
		return true;
	}
	else
	{
		waypointX = x;
		waypointY = y;
		return false;
	}
}
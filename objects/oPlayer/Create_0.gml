//Find currently occupied cell
cellX = (x - oUnitControl.gridX) div oUnitControl.cellSize;
cellY = (y - oUnitControl.gridY) div oUnitControl.cellSize;
//Add the cell to the grid
mp_grid_add_cell(global.NavGrid, cellX, cellY);

waypointX = x;
waypointY = y;

xAdj = 0;
yAdj = 0;

xPrev = x;
yPrev = y;

moving = false;
//Object speed
pSpeed = 0;
//Target speed
tSpeed = 1;
path = path_add();

rotationTarget = 0;
dir = "E";

//Creates a list of units following the player
//Make sure units are removed from this list when they are destroyed
followList = ds_list_create();

with oUnit
{
	//Set the unit's follow target to be oPlayer
	followTarget = oPlayer.id;
	ds_list_add(oPlayer.followList, id);
	//Store the unit's position in the group
	formationPosition = ds_list_find_index(oPlayer.followList, id) + 1;
}
unitType = choose("A", "B", "C");
selected = false;
sColour = c_white;

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

follow = false;
isFollowing = false;
followTarget = noone;
formationSize = 0;
formationPosition = 0;

stopCount = 0;

rotationTarget = 0;
dir = "E";

//Add the unit to the control object units list
ds_list_add(oUnitControl.unitsList, id);
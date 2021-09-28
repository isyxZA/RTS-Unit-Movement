//Initialize the navigation grid
//Cell width and height
cellSize = 32;
//Number of horizontal cells
gridHSize = 52;
//Number of vertical cells
gridVSize = 25;
//Grid x origin
gridX = x;
//Grid y origin
gridY = y;
//Create the navigation grid
global.NavGrid = mp_grid_create(gridX, gridY, gridHSize, gridVSize, cellSize, cellSize);

//All units list
unitsList = ds_list_create();
//Selected units list
selectedUnits = ds_list_create();

//Used to store mouse click positions
clickX = -1;
clickY = -1;

//Double-click count tracker
clickCount = 0;
//Time allowed for double-click
clickDelay = room_speed * 0.25;

//Used when left shift is being pressed
lshift = false;

//Number of units per formation row
rowSize = 3;
//Number of cells between units
unitSeparation = 2;

//Display triggers
showGrid = false;
showDebug = false;
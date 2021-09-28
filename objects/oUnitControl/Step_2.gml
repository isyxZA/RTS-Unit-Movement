// Key controls

//Show debug overlay
if keyboard_check_pressed(ord("B"))
{
	if !showDebug { showDebug = true; show_debug_overlay(true); }
	else { showDebug = false; show_debug_overlay(false); }
}

//Show the mp_grid
if keyboard_check_pressed(ord("G"))
{
	if !showGrid { showGrid = true; }
	else { showGrid = false; }
}

//Switch rooms
if keyboard_check_pressed(vk_tab) 
{ 
	if room_next(room) != -1
    {
		room_goto_next();
    } 
	else
	{
		room_goto(rmSandbox);
	}
}

//Exit the game
if keyboard_check_pressed(vk_escape)
{
	game_end();
}
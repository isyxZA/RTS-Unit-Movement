/// @description Unit control logic

/*
	Unit selection and movement control is enabled in rmSandbox in this instance.
	Units are set to follow the oPlayer in the other rooms. 
	Please check oPlayer create event for more info.
	This is to help demonstrate how the unit's followTarget variable can be used. 
	Please check oUnit alarm[1] event for more info.
*/

if room == rmSandbox
{
	//UNIT SELECTION\\
	//Left mouse button press
	if mouse_check_button_pressed(mb_left) 
	{
		//Store the mouse click position
		clickX = mouse_x;
		clickY = mouse_y;
	
		//If the mouse is touching a unit
		if place_meeting(clickX, clickY, oUnit) 
		{
			//Begin the double-click timer
			if clickCount == 0 { alarm[1] = clickDelay; }
			//Increment the double-click count
			++clickCount;
		}
	}

	//Left mouse button release
	if mouse_check_button_released(mb_left) 
	{
		if !ds_list_empty(unitsList)
		{
			//If the mouse is touching a unit
			var ui = instance_place(mouse_x, mouse_y, oUnit);
			//Check if it has been double-clicked
			if ui != noone && clickCount >= 2 
			{
				//If it has, then select all units of the same type
				SelectUnitType(ui.unitType);
			}
			//If there is no double-click
			else
			{
				//Check whether the left shift key is being pressed
				if keyboard_check(vk_lshift) { lshift = true; }
				else { lshift = false; }
				var ls = ds_list_size(unitsList);
				for (var i = 0; i < ls; ++i)
				{
					var lu = ds_list_find_value(unitsList, i);
					with lu
					{
						//Check if the unit has been selected or not
						SelectUnit(oUnitControl.clickX, oUnitControl.clickY, mouse_x, mouse_y, oUnitControl.lshift);
					}
				}
			}
		}
		//Reset mouse click position
		clickX = -1;
		clickY = -1;
	}

	//UNIT MOVEMENT\\
	//Right mouse button press
	if mouse_check_button_pressed(mb_right)
	{
		if !ds_list_empty(selectedUnits)
		{
			//Retrieve the number of selected units
			var sls = ds_list_size(selectedUnits);
			//If more than one unit has been selected
			if sls > 1
			{
				//The first unit on the list is the group leader
				var sll = ds_list_find_value(selectedUnits, 0);
				with sll
				{
					//Check if the cell the unit is attempting to move to is occupied or not
					if CellEmpty(mouse_x, mouse_y)
					{
						if follow
						{
							followTarget = noone;
							follow = false;
							isFollowing = false;
							alarm[1] = -1;
						}
						//Send the unit on its merry way
						MoveUnit(waypointX, waypointY);
					}
				}
				//All other units will follow the leader
				for (var i = 1; i < sls; ++i)
				{
					var slu = ds_list_find_value(selectedUnits, i);
					slu.followTarget = sll;
					slu.follow = true;
					slu.isFollowing = false;
					slu.formationSize = sls-1;
					slu.formationPosition = i;
					slu.alarm[1] = -1;
				}
			}
			//If only a single unit has been selected
			else
			{
				//Retrieve the unit from the list
				var su = ds_list_find_value(selectedUnits, 0);
				with su
				{
					//Check if the cell the unit is attempting to move to is occupied or not
					if CellEmpty(mouse_x, mouse_y)
					{
						if follow
						{
							followTarget = noone;
							follow = false;
							isFollowing = false;
							alarm[1] = -1;
						}
						//Send the unit on its merry way
						MoveUnit(waypointX, waypointY);
					}
				}
			}
		}
	}
}
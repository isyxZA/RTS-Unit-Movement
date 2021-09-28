/// @description scr_ToggleSelect(pressX, pressY, releaseX, releaseY) Determine whether to select or deselect a unit
/// @param pressX
/// @param pressY
/// @param releaseX
/// @param releaseY
/// @param shiftL
function SelectUnit(pressX, pressY, releaseX, releaseY, shiftL) 
{
	//Determine the selection box bounds
	var tlBR = (x > pressX && x < releaseX && y > pressY && y < releaseY);
	var blTR = (x > pressX && x < releaseX && y < pressY && y > releaseY);
	var brTL = (x < pressX && x > releaseX && y < pressY && y > releaseY);
	var trBL = (x < pressX && x > releaseX && y > pressY && y < releaseY);
    
	if (blTR || tlBR || brTL || trBL) 
	{ 
		//If the unit is inside the selection box
		if !selected 
		{ 
			ds_list_add(oUnitControl.selectedUnits, id); 
		}
		sColour = c_green;
		selected = true; 
	}
	else if place_meeting(x, y, oUnitControl) 
	{  
		//If a single unit has been clicked
		if !selected 
		{ 
			ds_list_add(oUnitControl.selectedUnits, id); 
		}
		sColour = c_green;
		selected = true; 
	}
	else 
	{ 
		//If the shift key is not being held then allow deselection
		if !shiftL
		{
			if selected 
			{ 
				ds_list_delete(oUnitControl.selectedUnits, ds_list_find_index(oUnitControl.selectedUnits, id)) 
			}
			sColour = c_white;
			selected = false; 
		}
	}
}
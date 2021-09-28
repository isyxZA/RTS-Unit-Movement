/// @ description SelectUnitType(type) Select all units of the same unit type
/// @param type Unit type
function SelectUnitType(type)
{
	if !ds_list_empty(unitsList)
	{
		//Loop thru the control object's units list
		var ls = ds_list_size(unitsList);
		for (var i = 0; i < ls; ++i)
		{
			var lu = ds_list_find_value(unitsList, i);
			//Check if the unit's types match
			if lu.unitType == type 
			{
				with lu
				{
					//Select the unit
					if !selected 
					{ 
						ds_list_add(oUnitControl.selectedUnits, id); 
					}
					sColour = c_green;
					selected = true;
				}
			}
			//If the types don't match then allow deselection
			else if lu.selected
			{
				with lu
				{
					ds_list_delete(oUnitControl.selectedUnits, ds_list_find_index(oUnitControl.selectedUnits, id));
					sColour = c_white;
					selected = false;
				}
			}
		}
	}
}
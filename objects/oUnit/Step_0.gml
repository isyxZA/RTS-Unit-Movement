/// @description Movement logic

//If the unit has been given a follow command
if follow
{
	//First make sure the follow target actually exists
	if instance_exists(followTarget)
	{
		//Pathfinding trigger
		if !isFollowing
		{
			isFollowing = true;
			//Time before the unit will run the pathfinding again...alarm[1] will set isFollowing to false
			alarm[1] = room_speed + formationPosition;
			//Retrieve the units x and y adjustments in order to stay in formation
			FormationPosition(oUnitControl.rowSize);
			//Check if the cell the unit is attempting to move to is occupied or not
			if CellEmpty(followTarget.x + xAdj, followTarget.y + yAdj)
			{
				//Reset the stop count...please check alarm[1] for more info.
				stopCount = 0;
				//Send the unit on its merry way
				MoveUnit(waypointX, waypointY);
			}
		}
	}
}

if moving
{
	//Check for when the unit has reached the end of its path
	//Adjust unit rotation while pathing
	TrackPath();
}
/// @description Pathfinding trigger

if instance_exists(followTarget)
{
	//If the unit's follow target is moving
	if followTarget.moving 
	{ 
		//Set isFollowing to false
		//This will make the unit attempt to find a new path
		//Please check the unit step event for more info.
		isFollowing = false; 
	}
	else
	{
		//The follow target has stopped but the unit is still out of position
		if point_distance(x, y, followTarget.x + xAdj, followTarget.y + yAdj) > oUnitControl.cellSize
		{
			//Allow time for the unit to reach its formation position
			++stopCount;
			if stopCount > 10
			{ 
				//Stop all pathfinding
				follow = false;
				isFollowing = false;
				//Remove the follow target
				//In other rooms the target remains as oPlayer
				if room == rmSandbox { followTarget = noone; }
			}
			else
			{
				//Attempt to find a new path
				isFollowing = false;
			}
		}
		else
		{
			//Stop all pathfinding
			follow = false;
			isFollowing = false;
			//Remove the follow target
			//In other rooms the target remains as oPlayer
			if room == rmSandbox { followTarget = noone; }
		}
	}
}
else
{
	//Stop all pathfinding
	follow = false;
	isFollowing = false;
	//Remove the follow target
	//In other rooms the target remains as oPlayer
	if room == rmSandbox { followTarget = noone; }
}
/// @description TrackPath() Adjust object speed and rotation when pathing
function TrackPath()
{
	//If the object has reached the end of it's path
	if path_position == 1 
	{ 
		moving = false; 
		pSpeed = 0;
		path_clear_points(path);
	}
	
	//A small acceleration at the start of the path
	if pSpeed != tSpeed { pSpeed = lerp(pSpeed, tSpeed, 0.01); path_speed = pSpeed; }
	
	//Rotate the object towards it's rotationTarget
	if image_angle != rotationTarget
	{
		image_angle += angle_difference(rotationTarget, image_angle) * 0.2;
	}
	
	//Determine the general direction of the object...North, South, East, West
	if rotationTarget > 45 && rotationTarget <= 135 { dir = "N"; }
	else if rotationTarget > 135 && rotationTarget <= 225 { dir = "W"; }
	else if rotationTarget > 225 && rotationTarget <= 315 { dir = "S"; }
	else { dir = "E"; }
}
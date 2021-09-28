/// @description Determine rotation target
if moving 
{
	rotationTarget = point_direction(xPrev, yPrev, x, y);
	xPrev = x;
	yPrev = y;
	alarm[0] = room_speed * 0.1; 
}

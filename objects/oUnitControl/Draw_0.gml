if (clickX != -1) && (clickY != -1) {
    draw_set_alpha(0.5);
    draw_roundrect_colour(clickX, clickY, mouse_x, mouse_y, c_white, c_white, true);
    draw_set_alpha(0.1);
    draw_roundrect_colour(clickX, clickY, mouse_x, mouse_y, c_gray, c_gray, false);
    draw_set_alpha(1);
}

if showGrid
{
	draw_set_alpha(0.3);
	mp_grid_draw(global.NavGrid);
	draw_set_alpha(1);
}
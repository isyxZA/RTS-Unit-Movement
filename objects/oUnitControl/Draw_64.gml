if room == rmSandbox
{
	draw_set_alpha(0.3);
	draw_rectangle_color(30, 850, 410, 1050, c_black, c_black, c_black, c_black, false);
	draw_set_alpha(1);
	draw_set_halign(fa_left);
	draw_text(40, 860, "Total Units: " + string(ds_list_size(unitsList)));
	draw_text(40, 890, "Selected Units: " + string(ds_list_size(selectedUnits)));
	draw_text(40, 920, "Left mouse to select");
	draw_text(40, 950, "Double click to select type");
	draw_text(40, 980, "Left mouse and drag for selection box");
	draw_text(40, 1010, "Hold Left shift to add to selected");
}

draw_set_halign(fa_center);
draw_text(display_get_gui_width() * 0.5, 1020, "--- Press G for navigation grid ---");
draw_text(display_get_gui_width() * 0.5, 1050, "--- Press TAB to switch rooms ---");

var _newWidth = surface_get_width(application_surface) * 6;
var _newHeight = surface_get_height(application_surface) * 6;
surface_resize(application_surface,_newWidth,_newHeight);
window_enable_borderless_fullscreen(true)
window_set_fullscreen(true);


cursor_sprite=sprMouse;
window_set_cursor(cr_none)

show_debug_log(true);
event_inherited()
depth=9300-y;

var collide = ds_list_create();
collision_rectangle_list(x-sprite_xoffset,y-sprite_yoffset,x-sprite_xoffset+sprite_width,y-sprite_yoffset+sprite_height,objGrasses,true,true,collide,false);
for(var i = 0; i < ds_list_size(collide); i++) {
	if(collide[| i].y<y) instance_destroy(collide[| i]);
}
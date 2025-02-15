image_index=1;
image_speed=0;
traps = ds_list_create();
for(var i = 0; i < sprite_width/8;i++){
	for(var j = 0; j < sprite_height/8;j++){
		
		var trap = instance_create_layer(x+i*8+4,y+j*8+10,"Instances2",objTrap);
		trap.depth=9300-trap.y;
		ds_list_add(traps,trap);
		if(!active) {
			trap.active=false;
			trap.visible=false;
		}
	}
}
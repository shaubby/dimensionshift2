if(place_meeting(x,y,objPlayer) and active) {
	var enemies=ds_list_create();
	ds_list_add(enemies,instance_create_layer(1065,765, "Instances1",objFairy));
	ds_list_add(enemies,instance_create_layer(1000,800, "Instances1",objSlime));
	ds_list_add(enemies,instance_create_layer(1050,800, "Instances1",objSlime));
	for(var i = 0; i < ds_list_size(enemies); i++){
		with(enemies[| i]){
			timercd=1;
			image_alpha=0;
			image_blend=c_white;
			aggro=true;
			active=true;
		}
	}
	instance_destroy(self)
}
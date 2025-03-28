



if(place_meeting(x,y,objPlayer) and !encounter) {
	encounter=true;

	//ds_list_add(tocreate2, [2208,640,objWizard]);
	ds_list_add(tocreate2, [2208,816,objWizard]);
	ds_list_add(tocreate2, [2408,816,objWizard]);
	objDimensions.maxcd=10;
	objPlayer.hitpoints = objPlayer.maxhitpoints
	
	barrel1 = instance_create_layer(2780,1028,"Instances1",objBarrel1)
	barrel2 = instance_create_layer(2780,1016,"Instances1",objBarrel1)
	barrel3 = instance_create_layer(2780,1004,"Instances1",objBarrel1)
	
}

if(encounter and !dimensionswitch and objDimensions.currentdimension == 1) {
	ds_list_add(tocreate1, [2200,936,objFungant]);
	ds_list_add(tocreate1, [2424,848,objFungant]);
	//ds_list_add(tocreate1, [2640,952,objFungant]);
	dimensionswitch=true;
}

if(encounter){
	var dt=delta_time/100000;
	progress-=dt;
	if(buttons[colorlist[| 0]].sprite_index==sprButtonPressed){
		progress=maxprogress
		ds_list_delete(colorlist, 0)
		if(ds_list_size(colorlist) == 0) {
			encounter=false;
			instance_destroy(barrel1)
			instance_destroy(barrel2)
			instance_destroy(barrel3)
			for(var i = 0; i < ds_list_size(enemies1); i++){
				instance_destroy(enemies1[| i])
			}
			for(var i = 0; i < ds_list_size(enemies2); i++){
				instance_destroy(enemies2[| i])
			}
		}
	}
	
}
#region Creation
	if(objDimensions.currentdimension==1 and encounter){
		for(var i = 0; i < ds_list_size(tocreate1); i++){
			
			var instance= instance_create_layer(tocreate1[| i][0],tocreate1[| i][1],"Instances1",tocreate1[| i][2])
			var collide =false;
			with (instance) if place_meeting(x,y,[objPlayer,objEnemyParent1]) collide=true;
			if(!collide){
				with(instance){
					timercd=1.5;
					image_alpha=0;
					image_blend=c_white;
					aggro=false;
					active=true;
				}
				ds_list_add(enemies1,instance);
				ds_list_delete(tocreate1,i);
				i--;
			} else {
				instance_destroy(instance)
			}
			//objDimensions.cd=objDimensions.maxcd/2
		}
	}
	if(objDimensions.currentdimension==2 and encounter){
		for(var i = 0; i < ds_list_size(tocreate2); i++){
			
			var instance= instance_create_layer(tocreate2[| i][0],tocreate2[| i][1],"Instances2",tocreate2[| i][2])
			var collide =false;
			with (instance) if place_meeting(x,y,[objPlayer,objEnemyParent2]) collide=true;
			if(!collide){
				with(instance){
					timercd=1.5;
					image_alpha=0;
					image_blend=c_white;
					aggro=false;
					active=true;
				}
				ds_list_add(enemies2,instance);
				ds_list_delete(tocreate2,i);
				i--;
			} else {
				instance_destroy(instance)
			}
			//objDimensions.cd=objDimensions.maxcd/2
		}
	}

for(var i = 0; i < ds_list_size(enemies1); i++){
	if(!instance_exists(enemies1[| i])){
		ds_list_delete(enemies1, i);
		i--;
		ds_list_add(tocreate1, [1916,500,objFungant]);
	}
}
for(var i = 0; i < ds_list_size(enemies2); i++){
	if(!instance_exists(enemies2[| i])){
		ds_list_delete(enemies2, i);
		i--;
		ds_list_add(tocreate2, [1990,792,objWizard])
		
	}
}

if(progress<=0) objPlayer.hitpoints = 0;
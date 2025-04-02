#region Stage 1
	#region Dimension 1
		if(place_meeting(x,y,objPlayer) and !encounter and !complete) {
			encounter=true;
			stage = 1
			ds_list_add(tocreate1,[712,1992, objFungiant2]);
			ds_list_add(tocreate1,[964,1996, objFungiant2]);
			ds_list_add(tocreate2,[712,1992, objDevil]);
			ds_list_add(tocreate2,[964,1996, objDevil]);
			objPlayer.invincible();
			objDimensions.maxcd=30;
			
		}
		else if (stage == 1 and encounter and ds_list_size(enemies1)==0 and ds_list_size(enemies2)==0) {
			ds_list_add(tocreate1,[712,2092, objFungiant2]);
			ds_list_add(tocreate1,[964,2092, objFungiant2]);
			ds_list_add(tocreate1,[716,1840, objFairy]);
			ds_list_add(tocreate1,[960,1840, objFairy]);			
			ds_list_add(tocreate2,[712,2092, objDevil]);
			ds_list_add(tocreate2,[964,2092, objDevil]);
			ds_list_add(tocreate2,[716,1840, objWizard]);
			ds_list_add(tocreate2,[960,1840, objWizard]);			
			objPlayer.invincible();
			objBluePlate.sprite_index = sprBluePlate;
			//objPlayer.hitpoints=objPlayer.maxhitpoints;
			//objPlayer.greenFlashAlpha=.125
			//objPlayer.greenFlashAlpha2=50
			stage = 2
		}
		else if (stage == 2 and encounter and ds_list_size(enemies1)==0 and ds_list_size(enemies2)==0) {
			ds_list_add(tocreate1,[712,2092, objFungiant2]);
			ds_list_add(tocreate1,[964,2092, objFungiant2]);
			ds_list_add(tocreate1,[716,1840, objFungiant2]);
			ds_list_add(tocreate1,[960,1840, objFungiant2]);			
			ds_list_add(tocreate2,[712,2092, objDevil]);
			ds_list_add(tocreate2,[964,2092, objDevil]);
			ds_list_add(tocreate2,[716,1840, objDevil]);
			ds_list_add(tocreate2,[960,1840, objDevil]);			
			objPlayer.invincible();
			objBluePlate.sprite_index = sprBluePlate;
			//objPlayer.hitpoints=objPlayer.maxhitpoints;
			//objPlayer.greenFlashAlpha=.125
			//objPlayer.greenFlashAlpha2=50
			stage = 3
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
			objDimensions.cd=objDimensions.maxcd/2
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
			objDimensions.cd=objDimensions.maxcd/2
		}
	}

for(var i = 0; i < ds_list_size(enemies1); i++){
	if(!instance_exists(enemies1[| i])){
		ds_list_delete(enemies1, i);
		i--;
	}
}
for(var i = 0; i < ds_list_size(enemies2); i++){
	if(!instance_exists(enemies2[| i])){
		ds_list_delete(enemies2, i);
		i--;
	}
}
if(ds_list_size(enemies1) == 0 and ds_list_size(enemies2) == 0 and stage2 == 3 and stage1 == 3){
	encounter=false
	complete=true
	audio_stop_all();
	room=Room5;
	for(var i=0; i <ds_list_size(crates); i++){
		instance_destroy(crates[| i]);
	}
}

#region Dimension 1
	if(place_meeting(x,y,objPlayer) and objDimensions.currentdimension==1 and stage1==0) {
		encounter=true;
	
		ds_list_add(tocreate1, [3756,248,objNecromancer]);
		ds_list_add(tocreate1, [3872,224,objNecromancer]);
		ds_list_add(tocreate1, [3908,312,objNecromancer]);
		ds_list_add(tocreate1, [4160,240,objNecromancer]);
		ds_list_add(tocreate1, [4212,404,objNecromancer]);

		ds_list_add(tocreate1, [3912,264,objSlime]);
		ds_list_add(tocreate1, [4136,288,objSlime]);
		ds_list_add(tocreate1, [4156,292,objSlime]);
		ds_list_add(tocreate1, [4172,276,objSlime]);

		ds_list_add(tocreate1, [3732,324,objFungant]);
		ds_list_add(tocreate1, [3992,264,objFungant]);
		ds_list_add(tocreate1, [4120,388,objFungant]);

		
		
		
		objDimensions.cd=0;
			
			
	
	
		stage1=1
			
		objPlayer.invincible();
			
	}
			
	#region Dimension 2
		else if(objDimensions.currentdimension==2 and stage2==0 and encounter){
			dimensionswitch=true;

			ds_list_add(tocreate2, [4180,280, objSlimeBall]);
			ds_list_add(tocreate2, [4112,260,objSlimeBall]);
			ds_list_add(tocreate2, [3940,276,objSlimeBall]);
			ds_list_add(tocreate2, [3892,300,objSlimeBall]);
			
			//ds_list_add(tocreate2, [4912,868,objSlimeBall]);
			//ds_list_add(tocreate2, [4908,776,objSlimeBall]);
			
			
			ds_list_add(tocreate2, [3752,184,objLancelot]);
			ds_list_add(tocreate2, [4008,280,objLancelot]);
			ds_list_add(tocreate2, [4232,168,objLancelot]);
			ds_list_add(tocreate2, [4232,384,objLancelot]);
			
			ds_list_add(tocreate2, [3900,192,objWizard]);
			ds_list_add(tocreate2, [4124,196,objWizard]);
			
	
			stage2=1
			objPlayer.invincible();
			encounter=true;
	
	}
			


#region Creation
	if(objDimensions.currentdimension==1 and encounter){
		for(var i = 0; i < ds_list_size(tocreate1); i++){
			
			var instance= instance_create_layer(tocreate1[| i][0],tocreate1[| i][1],"Instances1",tocreate1[| i][2])
			var collide =false;
			with (instance) if place_meeting(x,y,[objPlayer,objEnemyParent1]) collide=true;
			if(!collide){
				with(instance){
					image_blend=c_white;
					aggro=false;
					active=true;
					aggrodistance=200;
					timed=false;
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
					image_blend=c_white;
					aggro=false;
					active=true;
					aggrodistance=300;
					timed=false;
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
if(ds_list_size(enemies1) == 0 and stage1 == 1){
	objButton54.activated=true
}
if(ds_list_size(enemies2) == 0 and stage2 == 1){
	objButton64.activated=true
}
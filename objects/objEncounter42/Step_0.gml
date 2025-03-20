
#region Dimension 1
	if(place_meeting(x,y,objPlayer) and objDimensions.currentdimension==1 and stage1==0) {
		encounter=true;
	
		ds_list_add(tocreate1, [4244,776,objNecromancer]);
		ds_list_add(tocreate1, [4532,1044,objNecromancer]);
		//ds_list_add(tocreate1, [4796,904,objNecromancer]);
		ds_list_add(tocreate1, [4912,760,objNecromancer]);
		ds_list_add(tocreate1, [4928,908,objNecromancer]);
		ds_list_add(tocreate1, [4528,752,objNecromancer]);
		//ds_list_add(tocreate1, [4558,752,objNecromancer]);
		
		ds_list_add(tocreate1, [4248,1088,objSlime]);
		ds_list_add(tocreate1, [4656,744,objSlime]);
		ds_list_add(tocreate1, [4712,772,objSlime]);
		ds_list_add(tocreate1, [4856,812,objSlime]);
		ds_list_add(tocreate1, [4828,856,objSlime]);
		//ds_list_add(tocreate1, [4884,856,objSlime]);
		//ds_list_add(tocreate1, [4504,1084,objSlime]);
		//ds_list_add(tocreate1, [4492,1076, objSlime]);
		//ds_list_add(tocreate1, [4564,828, objSlime]);
		ds_list_add(tocreate1, [4520,796, objSlime]);
		
		ds_list_add(tocreate1, [4216,1132,objFungant]);
		ds_list_add(tocreate1, [4280,1132,objFungant]);

		
		
		
		objDimensions.cd=0;
			
			
	
	
		stage1=1
			
		objPlayer.invincible();
			
	}
			
	#region Dimension 2
		else if(objDimensions.currentdimension==2 and stage2==0 and encounter){
			dimensionswitch=true;

			ds_list_add(tocreate2, [4220,740, objSlimeBall]);
			ds_list_add(tocreate2, [4280,740,objSlimeBall]);
			ds_list_add(tocreate2, [4220,960,objSlimeBall]);
			ds_list_add(tocreate2, [4280,960,objSlimeBall]);
			
			ds_list_add(tocreate2, [4352,1100,objSlimeBall]);
			ds_list_add(tocreate2, [4352,1120,objSlimeBall]);
			
			ds_list_add(tocreate2, [4516,972,objSlimeBall]);
			ds_list_add(tocreate2, [4552,972,objSlimeBall]);
			
			//ds_list_add(tocreate2, [4912,868,objSlimeBall]);
			//ds_list_add(tocreate2, [4908,776,objSlimeBall]);
			
			ds_list_add(tocreate2, [4776,900,objLancelot]);
			ds_list_add(tocreate2, [4944,904,objLancelot]);
			ds_list_add(tocreate2, [4948,724,objLancelot]);
			//ds_list_add(tocreate2, [4536,728,objLancelot]);
			
			ds_list_add(tocreate2, [4464,1100,objWizard]);
			ds_list_add(tocreate2, [4468,1136,objWizard]);
			ds_list_add(tocreate2, [4512,868,objWizard]);
			ds_list_add(tocreate2, [4564,868,objWizard]);
			
	
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
	objButton34.activated=true
}
if(ds_list_size(enemies2) == 0 and stage2 == 1){
	objButton44.activated=true
}
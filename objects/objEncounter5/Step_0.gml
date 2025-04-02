#region Stage 1
	#region Dimension 1
		if(place_meeting(x,y,objPlayer) and !encounter and !complete) {
			encounter=true;
			ds_list_add(crates, instance_create_layer(864,1424,"Instances1",objBarrel1));
			ds_list_add(crates, instance_create_layer(852,1424,"Instances1",objBarrel1));
			ds_list_add(crates, instance_create_layer(840,1424,"Instances1",objBarrel1));
			ds_list_add(crates, instance_create_layer(828,1424,"Instances1",objBarrel1));
			ds_list_add(crates, instance_create_layer(816,1424,"Instances1",objBarrel1));
			ds_list_add(crates, instance_create_layer(804,1424,"Instances1",objBarrel1));
			dimensionswitch=true
			
			ds_list_add(tocreate1, [508,616, objFungiant]);
			ds_list_add(tocreate1, [1168,608, objFungiant]);
			ds_list_add(tocreate1, [1228,960, objFungiant]);
			ds_list_add(tocreate1, [840,1244, objFungiant]);
			ds_list_add(tocreate1, [456,948, objFungiant]);
			//ds_list_add(tocreate1, [840,908, objFungiant]);
			
			
			ds_list_add(tocreate1, [424,912, objNecromancer]);
			//ds_list_add(tocreate1, [472,912, objNecromancer]);
			ds_list_add(tocreate1, [1204,932, objNecromancer]);
			ds_list_add(tocreate1, [1256,932, objNecromancer]);
			ds_list_add(tocreate1, [748,988, objNecromancer]);
			//ds_list_add(tocreate1, [940,988, objNecromancer]);
			//ds_list_add(tocreate1, [748,1212, objNecromancer]);
			//ds_list_add(tocreate1, [928,1212, objNecromancer]);
			
			//ds_list_add(tocreate1, [1072,752, objFairy]);
			//ds_list_add(tocreate1, [616,756, objFairy]);
			
			
			
	
			
			encounter=true
			objDimensions.maxcd=20;
			stage1=1
			
			objPlayer.invincible();
			objPlayer.hitpoints=objPlayer.maxhitpoints;
			
		}
			
	#region Dimension 2
		else if(stage2==0 and objDimensions.currentdimension==2 and encounter and !complete){
			dimensionswitch=true;
			
	
			ds_list_add(tocreate2, [616,740, objLancelot]);
			ds_list_add(tocreate2, [1024,764, objLancelot]);
			ds_list_add(tocreate2, [660,1312, objLancelot]);
			ds_list_add(tocreate2, [956,1312, objLancelot]);
			ds_list_add(tocreate2, [844,1000, objLancelot]);
			
			ds_list_add(tocreate2, [716,832, objDragon]);
			ds_list_add(tocreate2, [972,832, objDragon]);
			//ds_list_add(tocreate2, [736,1012, objDragon]);
			ds_list_add(tocreate2, [980,1016, objDragon]);
			ds_list_add(tocreate2, [1184,908, objDragon]);
			ds_list_add(tocreate2, [1220,1088, objDragon]);
			//ds_list_add(tocreate2, [1224,1348, objDragon]);
			ds_list_add(tocreate2, [436,1320, objDragon]);
			ds_list_add(tocreate2, [500,912, objDragon]);
			//ds_list_add(tocreate2, [436,1064, objDragon]);
			
			ds_list_add(tocreate2, [884,844, objSlimeBall]);
			ds_list_add(tocreate2, [868,844, objSlimeBall]);
			ds_list_add(tocreate2, [876,830, objSlimeBall]);
			
			ds_list_add(tocreate2, [440,1188, objSlimeBall]);
			ds_list_add(tocreate2, [424,1188, objSlimeBall]);
			ds_list_add(tocreate2, [436,1176, objSlimeBall]);
			
			ds_list_add(tocreate2, [1044,1320, objSlimeBall]);
			ds_list_add(tocreate2, [1064,1316, objSlimeBall]);
			ds_list_add(tocreate2, [1056,1304, objSlimeBall]);
			
			
			
	
			stage2=1
			objPlayer.invincible();
	
		}
			


#region Creation
	if(objDimensions.currentdimension==1 and encounter){
		for(var i = 0; i < ds_list_size(tocreate1); i++){
			
			var instance= instance_create_layer(tocreate1[| i][0],tocreate1[| i][1],"Instances1",tocreate1[| i][2])
			var collide =false;
			with (instance) if place_meeting(x,y,[objPlayer,objEnemyParent1]) collide=true;
			if(!collide){
				with(instance){
					image_alpha=1;
					image_blend=c_white;
					aggro=false;
					active=true;
					aggrodistance = 200;
					timed = false;
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
					image_alpha=1;
					image_blend=c_white;
					aggro=false;
					active=true;
					aggrodistance = 200;
					timed = false;
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
if(ds_list_size(enemies1) == 0 and ds_list_size(enemies2) == 0 and stage2 == 1 and stage1 == 1){
	encounter=false
	complete=true
	for(var i=0; i <ds_list_size(crates); i++){
		instance_destroy(crates[| i]);
	}
}
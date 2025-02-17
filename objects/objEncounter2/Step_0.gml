#region Stage 1
	#region Dimension 1
		if(place_meeting(x,y,objPlayer) and !encounter) {
			encounter=true;
	
			instance_create_layer(1072,790,"Instances1",objBarrel1)
			instance_create_layer(1072,804,"Instances1",objBarrel1)
			instance_create_layer(1072,818,"Instances1",objBarrel1)
	
	
			//Fairies
			ds_list_add(tocreate1,[1264,736,objSlime]);
			ds_list_add(tocreate1, [1264,832,objSlime]);
			ds_list_add(tocreate1, [1312,780,objSlime]);
	
			//Fungants
			ds_list_add(tocreate1, [1212,700,objFungant]);
			encounter=true
			objDimensions.maxcd=25;
			stage1=1
			
			objPlayer.invincible();
			objPlayer.hitpoints=objPlayer.maxhitpoints;
			
		}
			
	#region Dimension 2
		else if(stage2==0 and objDimensions.currentdimension==2 and encounter){
			dimensionswitch=true;
	
			ds_list_add(tocreate2, [1210,716, objSlimeBall]);
			ds_list_add(tocreate2, [1346,908,objSlimeBall]);
			ds_list_add(tocreate2, [1334,900,objSlimeBall]);
	
			stage2=1
			objPlayer.invincible();
	
		}
			

#region ------------ Stage 2 -----------------
	#region Dimension 1
		else if(objDimensions.currentdimension==1 and stage1==1 and ds_list_size(enemies1) <= 0 and (stage2>1 or (ds_list_size(enemies2) <= 0 and stage2==1)) and encounter){
			//Fairies
			ds_list_add(tocreate1,[1264,736,objFairy]);
			ds_list_add(tocreate1, [1264,832,objFairy]);
			//ds_list_add(tocreate1, [1312,780,objFairy]);
	
			//Fungants
			ds_list_add(tocreate1, [1212,700,objFungant]);
			ds_list_add(tocreate1, [1358,720, objFungant]);

			//ds_list_add(tocreate1, [1204,908, objFungant]);
			stage1=2
			objPlayer.invincible();
			//objPlayer.hitpoints=min(objPlayer.hitpoints+2,objPlayer.maxhitpoints);
		}
			
	#region Dimension 2
		else if(objDimensions.currentdimension==2 and stage2==1 and ds_list_size(enemies2) <= 0 and (stage1>1 or (ds_list_size(enemies1) <= 0 and stage1==1)) and encounter){
	
	
			//Lancelots
			ds_list_add(tocreate2,[1130,754, objLancelot]);
			ds_list_add(tocreate2,[1388,728, objLancelot]);
			ds_list_add(tocreate2,[1148,848, objLancelot]);
			//ds_list_add(tocreate2,[1384,884,objLancelot]);

	
			//Slimeballs
			ds_list_add(tocreate2, [1210,716, objSlimeBall]);
			ds_list_add(tocreate2, [1334,900, objSlimeBall]);

			
			stage2=2
			objPlayer.invincible();
			//objPlayer.hitpoints=min(objPlayer.hitpoints+2,objPlayer.maxhitpoints);
		}

#region ------------ Stage 3 -----------------
	#region Dimension 1
		else if(objDimensions.currentdimension==1 and stage1==2 and ds_list_size(enemies1) <= 0 and (stage2>2 or (ds_list_size(enemies2) <= 0 and stage2==2)) and encounter){
			//Fairies
			ds_list_add(tocreate1,[1312,712,objFairy]);
			ds_list_add(tocreate1,[1128,832,objFairy]);

			
	
			//Fungants
			ds_list_add(tocreate1, [1200,688,objFungant]);
			ds_list_add(tocreate1, [1208,904,objFungant]);
			
			//Slime
			ds_list_add(tocreate1, [1208,704,objSlime]);
			ds_list_add(tocreate1, [1200,856,objSlime]);
			ds_list_add(tocreate1, [1344,872,objSlime]);


			//ds_list_add(tocreate1, [1204,908, objFungant]);
			stage1=3
			objPlayer.invincible();
			//objPlayer.hitpoints=min(objPlayer.hitpoints+2,objPlayer.maxhitpoints);
		}	
	#region Dimension 2
		else if(objDimensions.currentdimension==2 and stage2==2 and ds_list_size(enemies2) <= 0 and (stage1>2 or (ds_list_size(enemies1) <= 0 and stage1==2)) and encounter){
	
	
			//Lancelots
			ds_list_add(tocreate2,[1220,880, objLancelot]);
			ds_list_add(tocreate2,[1384,724, objLancelot]);

	
			//Slimeballs
			ds_list_add(tocreate2, [1320,660, objSlimeBall]);
			ds_list_add(tocreate2, [1200,856, objSlimeBall]);

			
			//Wizards
			ds_list_add(tocreate2, [1390,896, objWizard]);
			ds_list_add(tocreate2, [1144,752, objWizard]);


			
			stage2=3
			objPlayer.invincible();
			//objPlayer.hitpoints=min(objPlayer.hitpoints+2,objPlayer.maxhitpoints);
		}
#region Creation
	if(objDimensions.currentdimension==1 and encounter){
		for(var i = 0; i < ds_list_size(tocreate1); i++){
			
			var instance= instance_create_layer(tocreate1[| i][0],tocreate1[| i][1],"Instances1",tocreate1[| i][2])
			var collide =false;
			with (instance) if place_meeting(x,y,[objPlayer,objEnemyParent1]) collide=true;
			if(!collide){
				with(instance){
					timercd=3;
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
		}
	}
	if(objDimensions.currentdimension==2 and encounter){
		for(var i = 0; i < ds_list_size(tocreate2); i++){
			
			var instance= instance_create_layer(tocreate2[| i][0],tocreate2[| i][1],"Instances2",tocreate2[| i][2])
			var collide =false;
			with (instance) if place_meeting(x,y,[objPlayer,objEnemyParent2]) collide=true;
			if(!collide){
				with(instance){
					timercd=3;
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
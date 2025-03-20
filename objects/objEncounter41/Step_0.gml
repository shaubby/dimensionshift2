
#region Dimension 1
	if(place_meeting(x,y,objPlayer) and objDimensions.currentdimension==1 and stage1==0) {
		encounter=true;
	
		ds_list_add(tocreate1, [3160,336,objSlime]);
		ds_list_add(tocreate1, [3188,300,objSlime]);
		ds_list_add(tocreate1, [3332,324,objSlime]);
		ds_list_add(tocreate1, [3372,332,objSlime]);
		
		ds_list_add(tocreate1, [3184,408,objFungant]);
		ds_list_add(tocreate1, [3228,248,objFungant]);
		ds_list_add(tocreate1, [3264,312,objFungant]);

		
		
		ds_list_add(tocreate1, [3212,364,objFairy]);
		
		ds_list_add(tocreate1, [3272,330,objFairy]);
		
		
		
		objDimensions.cd=0;
			
			
	
	
		stage1=1
			
		objPlayer.invincible();
			
	}
			
	#region Dimension 2
		else if(stage2==0 and objDimensions.currentdimension==2 and stage2==0 and encounter){
			dimensionswitch=true;

			ds_list_add(tocreate2, [3264,336, objSlimeBall]);
			ds_list_add(tocreate2, [3252,320,objSlimeBall]);
			ds_list_add(tocreate2, [3272,320,objSlimeBall]);
			
			ds_list_add(tocreate2, [3104,220,objLancelot]);
			ds_list_add(tocreate2, [3392,220,objLancelot]);
			ds_list_add(tocreate2, [3104,444,objLancelot]);
			ds_list_add(tocreate2, [3392,444,objLancelot]);
			
	
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
if(ds_list_size(enemies1) == 0 and stage1 == 1){
	objButton14.activated=true
}
if(ds_list_size(enemies2) == 0 and stage2 == 1){
	objButton24.activated=true
}
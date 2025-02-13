event_inherited();


if(active and aggro) {
	var collision = ds_list_create();
	
	instance_place_list(x,y,objHitbox1, collision, true);
	for(var i=0; i < ds_list_size(collision); i++){
		
		if(y>collision[| i].y){
			depth=collision[| i].object.depth-1
			
		}else{
			depth=collision[| i].object.depth+1
		}
	}
	if(!kb){
		var dt = delta_time/100000;
		if(cd<=0){

			var tempdir = random_range(0,360);
			var templength= random_range(mindistance, maxdistance);
			if(!collision_line(objPlayer.x+lengthdir_x(templength,tempdir),objPlayer.y+lengthdir_y(templength,tempdir),objPlayer.x,objPlayer.y,objBulletProof1,false,true) and !place_meeting(objPlayer.x+lengthdir_x(templength,tempdir),objPlayer.y+lengthdir_y(templength,tempdir), objEnemyAvoidance1)){
				x=objPlayer.x+lengthdir_x(templength,tempdir);
				y=objPlayer.y+lengthdir_y(templength,tempdir);
				sprite_index=sprFungusAppear;
				image_index=0;
				alarm_set(0, 80);
				cd=random_range(mincd,maxcd);
			}
		} else cd -=dt;
		if(place_meeting(x,y,objPlayerHitbox) and !objPlayer.hit){
			objPlayer.takeHit();
			objPlayer.hp-=20;
			knockback(kblength,point_direction(objPlayerHitbox.x,objPlayerHitbox.y,x,y),kbspd);
		}
		if(direction<90 or direction>270) image_xscale=1;
		else image_xscale=-1
		
	}
}


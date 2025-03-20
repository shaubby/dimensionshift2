/*=delta_time/100000;
if(dir==1){
	image_angle+=rotspd*dt;
	if(image_angle>5) dir=-1;
}else {
	image_angle-=rotspd*dt;
	if(image_angle<-5) dir=1;
}*/
dt=delta_time/100000;
if(dir==1){
	image_yscale+=spd*dt;
	image_xscale+=spd*dt;
	if(image_yscale>=1.1)dir=-1
} else {
	image_yscale-=spd*dt;
	image_xscale-=spd*dt;
	if(image_yscale<=.9)dir=1;
}

if(image_angle!=0){
	if(!place_meeting(x,y,[objPlayer,objEnemyParent1,objFlyingEnemyParent1])){
		image_angle=0	
	}
}
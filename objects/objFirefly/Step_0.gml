var dt=delta_time/100000;
speed=spd*dt;
length-=dt;
if(length<=0){
	direction=random_range(0,360);
	length=random_range(minlength,maxlength);
	spd=random_range(1,2)
}
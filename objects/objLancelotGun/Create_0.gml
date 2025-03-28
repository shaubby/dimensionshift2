event_inherited()
cd=0
maxcd=5;
collisionline=false;
maxrotspd=10;
if(objDimensions.difficulty == 1) {
	predictive=random_range(50,100);
} else if(objDimensions.difficulty == 2) {
	predictive=random_range(25,50);
}

predictivecd=1000
alarm_set(1,random_range(predictivecd-300,predictivecd+300));
image_angle=270
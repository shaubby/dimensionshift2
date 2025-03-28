
if(objDimensions.difficulty == 1) {
	predictive=random_range(50,100);
} else if(objDimensions.difficulty == 2) {
	predictive=random_range(25,50);
}
alarm_set(1,random_range(predictivecd-300,predictivecd+300));
//declared variables to use globally
int randomized;
Bacteria [] colony;
int foodX = 200;
int foodY = 200;   
boolean poison = false;
void setup()
{     
	//intialized bacteria array
	 size(400,400);
	 colony = new Bacteria[350];
	 for (int i = 0; i<colony.length; i++) {
		colony[i] = new Bacteria();
	}
}   
void draw()   
{    
	//redraw background
	background(0);
	if (keyPressed) {
		if (key == 'p' || key == 'P') {
			poison = true;
		} else {
			poison = false;
		}
	}
	//give each bacteria the random walk direction and show them
	for (int i = 0; i<colony.length; i++) {
		colony[i].roll();
		colony[i].show();
	}
}  
void mousePressed()
{
	foodX = mouseX;
	foodY = mouseY;
} 
class Bacteria    
{     
	//declared the bacteria variables
	int myX, myY, myR, myG, myB;
	Bacteria() 	
	{
		//set all variables to random integers
		myX = (int)(Math.random()*400);
		myY = (int)(Math.random()*400);
		myR = (int)(Math.random()*256);
		myG = (int)(Math.random()*256);
		myB = (int)(Math.random()*256);
	}
	void roll() 
	{
		//randomize number to determine the walk direction
		randomized = (int)(Math.random()*10);
	}
	void show()
	{
		//each bateria has their own random color that does not change
		fill(myR,myB,myG);
		//white outline for all bacteria
		stroke(255);
		//draw the circle representing each bacteria
		ellipse(myX, myY, 10, 10);
		fill(255);
		rect(foodX-5,foodY-5,10,10);
		//this giant nested if statement determines direction
		//if the determiner is 0,1,2,3,6,7,8 or 9 then the bacteria moves in the corresponding direction
		//if 4 or 5 then the bacteria movement depends on the mouse placement and poison status
		if ((randomized == 0 || randomized == 6) && myY > 0) {
			myY--;
		} else if ((randomized == 1 || randomized == 7) && myX < 400) {
			myX++;
		} else if ((randomized == 2 || randomized == 8) && myY < 400) {
			myY++;
		} else if ((randomized == 3 || randomized == 9) && myX > 0) {
			myX--;
		} else {
			if (myX > foodX && randomized == 4 && poison == false) {
				myX--;
			} else if (myX < foodX && randomized == 4 && poison == false) {
				myX++;
			} else if (myY > foodY && randomized == 5 && poison == false) {
				myY--;
			} else if (myY < foodY && randomized == 5 && poison == false) {
				myY++;
			} else if (myX > foodX && randomized == 4 && poison == true && myX < 400) {
				myX++;
			} else if (myX < foodX && randomized == 4 && poison == true && myX > 0) {
				myX--;
			} else if (myY > foodY && randomized == 5 && poison == true && myY < 400) {
				myY++;
			} else if (myY < foodY && randomized == 5 && poison == true && myY > 0) {
				myY--;
			} 
		}
	}
}    
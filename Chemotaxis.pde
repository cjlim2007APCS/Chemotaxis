//declared variables to use globally
int randomized;
Bacteria [] colony;   
void setup()   
{     
	//intialized bacteria array
	 size(400,400);
	 colony = new Bacteria[200];
	 for (int i = 0; i<colony.length; i++) {
		colony[i] = new Bacteria();
	}
}   
void draw()   
{    
	//redraw background
	background(0);
	//give each bacteria the random walk direction and show them
	for (int i = 0; i<colony.length; i++) {
		colony[i].roll();
		colony[i].show();
	}
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
		randomized = (int)(Math.random()*6);
	}
	void show()
	{
		//each bateria has their own random color that does not change
		fill(myR,myB,myG);
		//white outline for all bacteria
		stroke(255);
		//draw the circle representing each bacteria
		ellipse(myX, myY, 10, 10);
		//this giant nested if statement determines direction
		//if the determiner is 0,1,2 or 3 then the bacteria moves in the corresponding direction
		//if 4 or 5 then the bacteria movement depends on the mouse placement
		if (randomized == 0) {
			myY--;
		} else if (randomized == 1) {
			myX++;
		} else if (randomized == 2) {
			myY++;
		} else if (randomized == 3) {
			myX--;
		} else {
			if (myX > mouseX && randomized == 4) {
				myX--;
			} else if (myX < mouseX && randomized == 4) {
				myX++;
			} else if (myY > mouseY && randomized == 5) {
				myY--;
			} else if (myY < mouseY && randomized == 5) {
				myY++;
			}
		}
	}
}    